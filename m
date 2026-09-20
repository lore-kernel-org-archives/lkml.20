Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FAD361DC3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873224; cv=none; b=eQXC8/thn4EJiYrbA+xo22jmZH3VJ/WpM0OLByqQAQyh04DcSptrQg0mJaqu3NTGDBx3KsBXRBdi7rT+F12JzKT/7vVOjb8jU86xinHJfFHMsQDHXvwS1ib4aVX1vPXs2PvGvAsrGTZu8JT4tncaiRyfv4d7tPqmxnHNANT9a00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873224; c=relaxed/simple;
	bh=a9zWynn0wGlYLsRFsMf3McHS/3/E2zODMA+SXVN94ZE=;
	h=In-Reply-To:References:Content-Type:Date:From:Subject:Message-Id:
	 Mime-Version:To:Cc; b=bpexp92yZrHeE3As4WIImcP2WziuW9JpNMswBMUUTDPxng1QqkJfiv5Vv5n+cMHtXNhXjcKfU45uX+PdzO9Ax5tqMDF2OZUBIKnZ5XA+/9kJmGFK5GTiDhBLKOnnniI5LmnhBRh1o+r/DE3cjQhTmvjgKcYpaTm1kg9BTjhlC9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iT7ha/C9; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iT7ha/C9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789873215; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=a9zWynn0wGlYLsRFsMf3McHS/3/E2zODMA+SXVN94ZE=;
 b=iT7ha/C9J2J/OhxLOpJ3cJ8APC0SSmRa3KVnVeNSG/7hJVEfXjz31Zaqc6679K4qP/V0ar
 Q8ROrDiCiUCtygYkuo/96bz8/gHMDys15yDL5D2Mhg1ZGEuco5yKDJ2kdKqdudKPXLMNoQ
 A+5ti8vyNRizhnMME/4/WQug6XhBmwZ4/mZscCNGD94vUwEpRdwX2dYo9PQhKfS89qNHuZ
 fXhtbOLKL05cbAoS/I3fyaIyj43FPK+IWuhB1o9t0Dp0uw2GR25+K9g4HaTAfmXhNdZ2I9
 as7SS0VRnM9YOAvFv5Ia0wcxv5Eu+g8Sh605E2vnaIyZFgYsFeIDMlJUtx0utg==
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <26000aa9-86b0-4fd8-8bda-67f38372cdb7@roeck-us.net>
References: <20260918031831.1937973-1-zhangjian.3032@bytedance.com> <26000aa9-86b0-4fd8-8bda-67f38372cdb7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 10:59:53 +0800
X-Lms-Return-Path: <lba+26aaf4c3e+823a02+vger.kernel.org+zhangjian.3032@bytedance.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
From: "Jian Zhang" <zhangjian.3032@bytedance.com>
Subject: Re: [PATCH] hwmon: peci: dimmtemp: Retry unstable DIMM mask detection
Message-Id: <90D71779-52F1-4456-BD8C-5E5D40A2FF99@bytedance.com>
X-Original-From: Jian Zhang <zhangjian.3032@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Iwona Winiarska" <iwona.winiarska@intel.com>, 
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>

> 2026=E5=B9=B49=E6=9C=8819=E6=97=A5 00:59=EF=BC=8CGuenter Roeck <linux@roe=
ck-us.net> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Sep 18, 2026 at 11:18:31AM +0800, Jian Zhang wrote:
>> Add a stable DIMM mask check around PECI DIMM discovery.
>>=20
>> During host DIMM initialization, PECI can answer the DIMM temperature
>> configuration reads before every DIMM has reached a stable ready state.
>> There is no separate all-DIMM-ready signal for this driver to wait on,
>> so a single early read can capture only part of the populated DIMM mask.
>> Retrying the mask check avoids locking that transient state into the
>> hwmon device layout.
>>=20
>> The first successful scan is saved, and the driver immediately scans
>> again before registering hwmon channels. If the two masks differ, the
>> driver returns -EAGAIN so the existing delayed detection work can retry
>> instead of exposing a partial channel set.
>>=20
>> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>> ---
>>=20
>> This was tested on an affected platform where probing during
>> host DIMM initialization could expose an incomplete DIMM mask. With the
>> extra read, the driver observed the completed DIMM mask and exported the
>> expected hwmon channels.
>>=20
>> This is intentionally a conservative retry of the existing detection
>> path. It does not add a sleep or force another delayed-work interval
>> between the two reads, so it avoids adding an unconditional probe delay.
>> However, this also means it is not a full proof that the host DIMM
>> initialization has completed.
>>=20
>> I am not aware of an Intel-provided all-DIMM-ready indication for this
>> path. Feedback would be appreciated if there is a better way to decide
>> that the PECI DIMM mask is stable before registering the hwmon device.
>>=20
>> drivers/hwmon/peci/dimmtemp.c | 28 +++++++++++++++++++++++++++-
>> 1 file changed, 27 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp=
.c
>> index bd3e8715dfec..983e1e415ec2 100644
>> --- a/drivers/hwmon/peci/dimmtemp.c
>> +++ b/drivers/hwmon/peci/dimmtemp.c
>> @@ -285,6 +285,32 @@ static int check_populated_dimms(struct peci_dimmte=
mp *priv)
>> return 0;
>> }
>>=20
>> +static int check_populated_dimms_stable(struct peci_dimmtemp *priv)
>> +{
>> + DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
>> + int ret;
>> +
>> + ret =3D check_populated_dimms(priv);
>> + if (ret)
>> + return ret;
>> +
>> + bitmap_copy(dimm_mask, priv->dimm_mask, DIMM_NUMS_MAX);
>> +
>> + ret =3D check_populated_dimms(priv);
>> + if (ret)
>> + return ret;
>> +
>> + if (!bitmap_equal(dimm_mask, priv->dimm_mask, DIMM_NUMS_MAX)) {
>> + dev_dbg(priv->dev,
>> + "Deferred unstable DIMM mask: %*pbl -> %*pbl\n",
>> + DIMM_NUMS_MAX, dimm_mask, DIMM_NUMS_MAX,
>> + priv->dimm_mask);
>> + return -EAGAIN;
>> + }
>> +
>> + return 0;
>> +}
>=20
> I agree with the idea, but check_populated_dimms() already has retry
> support. I don't see why it would make sense to add retry detection
> (because additional DIMMs were detected) on top of retry detection
> (because no DIMMs were detected).

Right, the existing retry in check_populated_dimms() does not cover this
case.

It only retries when no usable DIMM mask is available, for example when
all channel/rank reads return -EINVAL or when the resulting mask is
empty.

The failure I observed is a partial-success case: the PECI reads succeed
and produce a non-empty mask, so check_populated_dimms() returns 0, but
the mask may still miss DIMMs while host DIMM initialization is still in
progress. Once hwmon is registered with that partial mask, the missing
channels are not added later.


>=20
> Thanks,
> Guenter
>=20
>> +
>> static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
>> {
>> int rank =3D chan / priv->gen_info->dimm_idx_max;
>> @@ -322,7 +348,7 @@ static int create_dimm_temp_info(struct peci_dimmtem=
p *priv)
>> * All other states mean that the platform never reached the state that
>> * allows to check DIMM state - causing us to retry later on.
>> */
>> - ret =3D check_populated_dimms(priv);
>> + ret =3D check_populated_dimms_stable(priv);
>> if (ret =3D=3D -ENODEV) {
>> dev_dbg(priv->dev, "No DIMMs found\n");
>> return 0;
