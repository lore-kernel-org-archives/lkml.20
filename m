Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512946EF92;
	Wed,  9 Sep 2026 20:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986145; cv=none; b=M/Fs6QBvJregnr6x6f90/ix5sYiWfiyIdX+l1NIHufFlc72vrtdctvko8ntVJruUhweDshEW8gs+JVPSbD9dSHm1x/uxzD1czmCHoAD971O5LKtcKbPJUZvhH4OQETE1HTthCwn/5zQAyHedRId4L+7XiDuzukzxMF3FkSb7kt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986145; c=relaxed/simple;
	bh=TXqlY98w1aE20jfY3Fgxbx8NTjcocPxYQogZfFtKtpY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dT8Me+/CSXQxfo98BiFLa+tZ6D8tQpmenVBe1y5jkp1zGd59PgabTzTnwDGvuWYvbRRjJOnQaA+mm0O9VcmmTAcNp7GdK5n0DGTlzY4joIFb/EMzE5AKprmjSkNq7SVPqZMrBZQXFpSm9ANejOJx47XuyjX7pXGycRHVj5crmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Hbm6ZmUq; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Hbm6ZmUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788986137; x=1789245337;
	bh=6XQzlI+x/Mrh3cmxN3t1L9AEhHISL1NCWiJeiJcmU3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Hbm6ZmUqjZJvdEw9NSwwQTdqoGOrlJQc/V94S8n6SOS7dPjGxm3+lDnnXzewWbS0C
	 agUutc7m8wStVEc5H55Q+cEZmGHlF6r/6SEZkXfT0yL3ITRXmO7IZFETZ+ClfJRChK
	 CNnVhv0JfvIAbxUbtCtNzXVvDM+s/VsmUO4ur9KmEJT/U6CMtZtagb2oAAVcp40p6/
	 LHV8nwqQpMILWfofVng2HUaqM9Lo7DkhvhDOOKP5jdxnA1wNMDITz6ZeRnUu7W/Hn+
	 EaXcWcNTTOqmoxLl+8/DandtLfmmdc/zeS79OFzSDcEQkXFpm6cvoOG+3d/bpVXQRX
	 nwqlaPKu5hU0g==
Date: Wed, 09 Sep 2026 20:35:33 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260909203527.90372-1-lsa.uz@pm.me>
In-Reply-To: <20260909193953.86192-3-lsa.uz@pm.me>
References: <20260909193953.86192-1-lsa.uz@pm.me> <20260909193953.86192-3-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 217f5eabfc9141bff3d4b3066f20c9e2cd5471e9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Correct, and it is a regression I introduced between v1 and v2. The v2 cove=
r
letter also offered to spread the same mistake across six more drivers, so
that offer needs withdrawing before anything else.

Withdrawing the cleanup offer
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

The cover said the "!" form is in gc05a2, gc08a3, imx283, lm3560, og0ve1b a=
nd
ov6211 and offered a cleanup converting them. Please do not take that up, a=
nd
if anyone has begun, stop: converting them to "<=3D 0" would break each of =
them
exactly as it broke this driver.

The reasoning behind the offer was wrong in a specific way worth naming. I
compared against i915, xe, ipa, ivpu and arm-smmu, which do test "> 0" or
"<=3D 0" - but they sit where CONFIG_PM is effectively mandatory, so the th=
ird
return never reaches them. drivers/media/i2c builds without PM, and that is
the whole of the difference.

The finding
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Without CONFIG_PM the helper is, unconditionally:

  static inline int pm_runtime_get_if_active(struct device *dev)
  {
          return -EINVAL;
  }

v1's "if (!...)" fell through on that and applied the control, which is the
right thing to do: with no runtime PM the sensor is powered from probe and
never suspended. v2's "<=3D 0" returns 0 instead and drops it - exposure, g=
ain,
blanking, test pattern, all of them, with nothing reported to the caller.

v3 will use the shape ov64a40 already has:

          pm_status =3D pm_runtime_get_if_active(imx681->dev);
          if (!pm_status)
                  return 0;
          ...
          if (pm_status > 0)
                  pm_runtime_put(imx681->dev);

0 skips, 1 applies and puts, -EINVAL applies and does not put. That answers=
 the
first review's finding - the put of a reference never taken - without losin=
g
the case v1 had right by accident.

ov64a40 is the only fully correct caller of this helper in drivers/media/i2=
c.
I looked at it when the first review landed, wrote it down as a variant of =
the
same thing, and did not read its second half. Had I done so, v2 would have
carried this.

If a cleanup for the other six is still wanted, that is the shape it should
take, and I will send one only if a maintainer asks.

v3 follows this message. Respinning within hours is not something I would
normally do, but nobody has reviewed v2 yet and the alternative is asking
people to read code I already know is wrong. The change is ten lines, six o=
f
them comment, and 1/3 and 3/3 are byte-identical to v2.

The other finding, on 3/3, which is not ours
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The same run flagged a High issue in ipu-bridge and marked it pre-existing.=
 It
is - our 3/3 is two lines of table entry - but I checked it rather than wav=
ing
it past, and it looks real. Sakari, Dan: this is yours rather than mine.

The reference. sensor->adev =3D ACPI_PTR(acpi_dev_get(adev)) takes a second
reference to the ACPI device. On "goto err_free_swnodes" only the iterator'=
s is
dropped, by acpi_dev_put(adev), and bridge->n_sensors has not been incremen=
ted
yet, so ipu_bridge_unregister_sensors() does not walk this sensor either.
Narrow in practice: ipu_bridge_instantiate_ivsc() returns 0 immediately whe=
n
there is no csi_dev, so reaching it needs a machine with an IVSC.

The fwnode pointers look wider to me. primary->secondary is assigned in
ipu_bridge_connect_sensor(), and set_secondary_fwnode(sensor->csi_dev, fwno=
de)
in ipu_bridge_instantiate_ivsc(). Neither is cleared anywhere in the file,
while ipu_bridge_unregister_sensors() calls
software_node_unregister_node_group() on the nodes they point at. The file
walks that chain itself, in ipu_bridge_check_fwnode_graph(fwnode->secondary=
).
That is the ordinary unbind path rather than an error path.

No patch from me for either: I have no IVSC machine and no way to force the
failure, and an untested lifetime change in someone else's driver is worth
less than a clear report.

Sergey

