Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8430D3750D7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475018; cv=pass; b=G3zTPCEU4OAlOtWvE6m4OrUYyzVBd2WAhhZN8/4+aQN81ygfkmXJHw043HwfFtmDz188XrnBaJDPCFYFj6PMhHfMMXY83tP7gBeDbashHNj30Cg+xs6sfKopfh+Joc33QdZA2LZE7mWo7Gkau90f4WelfFJ6O9WDyzAb1y9qz1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475018; c=relaxed/simple;
	bh=mFiJ08W4a5OBXJwVwrhjRDGXwqW9MrIAwZAygtDyiuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPFZJ+QMHu45Bhf1/TT1or4wkvLWBtucy0UIwFevqW7EWTAxJN5Swml9tvcuVejPhpHC949RTKDJcUntgQ8rSHiOxwkO3PHxyLWEG9FN5tKIPDXpGoCtwNPcfiS40fHUuXStODF4Zablp4jl3GesZBV+mIsrNMN9giJX36usikM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTVom41g; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTVom41g"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90f9f8553e0so5225556d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788475015; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1KzAmJ2hoOZy1xjh3axd0K/bN+2HlZYyO0/mIPsq0QC2ECgRKX37yVDc3eFV5oX5K
         DI9x/pGOWuz5ffPlyaGTl1fwq36x+72XsemQ7BvcP7W0OrZCH9uul/YhP36PdS9YBVg4
         +z1ehH5m+JZQodYhYVbpWDQ/YvMf3/4e5rG7XpDEhLRE7xPLoSLeMmaGYvHDuat+f8Rr
         cGyjDpgVL+9iQbMJWeSy7XbxfehE1UDJyK9HNzUO/Y0NKQ22ShKiOhUTp+FhLuwBaAvO
         VYMJw97+w4EKnhlZRXJgrfS08aNGfcUhuMv7XSC7ReEzl6HOzBZaXUSoiao848z63dDV
         YmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LLwHncsTbuxPzx5yYNEBeAPEkhiwNDT/H784knECcqk=;
        fh=dZYUH/HYhdGM0cKDZir4fEpRHCdHmbz6TJ5go6snh/k=;
        b=syhj/62v1s+ttvnUHOFv/8NymE651RoDbKqKNpQhU6rG16joMc3AYAskg0pqtNArZm
         y04JHjYiqbhwcdaJRWE4bVHZcZ4MjFrPpFrzBzdcaIRBM48dRDs3z4EZOOHQjrIEQX9I
         aOfTjmUQz56f63XDag3FsIuxjFMzFuwCJ21Q4VTVDKlr5gAdbTHYyaMzegQgI66d3ECT
         j/3n3iSxT20JwVWWM2HYbQ43tdE5AqJdwtfCVPKq01vKUHsf+rtCeCR+ymjkciwryaZ+
         +PsamjqY53ICghlhqrirRGrCrky6E7+I9zAm9kEHnPYWd156CAIXutoo1q5AYE+CUUXS
         E1Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788475015; x=1789079815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LLwHncsTbuxPzx5yYNEBeAPEkhiwNDT/H784knECcqk=;
        b=jTVom41gTJ/QUY33W75BX5Laj9qV7Bhvb40FlPApjflL2RVqYMRK7VzUoZhyYzKuht
         mEdP32TX9LBhVGEMqeJgoCUP6iIaGcnwAdYpuG5HLRMRtcwOw2cPI2izdPm0w//U4S1R
         vbv+pwnCQ7Ol5w+0/iUSscvDkx8k1fCnel8HMHhNxfYNpLgqI1wNl+SS0qgBlmfR4Vp3
         v6GHEF6YCLsYqRP1qMgTmt8s8gM6FLpmMp6xrOODRSgy29Wi/qFkfi0/46g2JnV/r0RF
         P2NMKzutLHt8ecRXmYLn0nwlVZigqBzvH4FQpTRFeRYfbGD71ADZRk4BUwXXRijY0lLt
         tasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788475015; x=1789079815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLwHncsTbuxPzx5yYNEBeAPEkhiwNDT/H784knECcqk=;
        b=Mj8BR06L+2Gia4gj4UjFUOpI78KDf66I4eFlooMyRt7gFJzlQ6yPO/6WKB+YLZ02fI
         oxo44fuAbzSyLj9fQ/TQ/hUEm5XFheQmikAgYjbxmbCG55NnYeuQqPQ29tb+XdUjdgsr
         Wb2mp6fSe+AV4AyjuMgIUD1xLFBzCjLetmiBNKYojG7bFm4anMDwUEUXPB2ygeZj+imv
         t0FWw/m6e2I38kFSfXFx5Yt8Iw1GLX4LsdWbUJ5F+j+yId/9UAmqBbDDwbEc98MZUmVL
         XjEPdeLjeQRt0P9GW7N9PFWI4gaMXHEt1dsR+b/uh3XC9u7kTj2YyzmZOOvROD0VhAQ4
         MleQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgd5E1UNxPLpbxh/l1Xx86thOStzXZe3M/8ce/0SeKGN8RW5QsM6TrbwwhraJaubmJDSwj65H+bPoCSCk=@vger.kernel.org
X-Gm-Message-State: AFuF++l5HLXpro+H2LKvo12r4BdMQFBXGZ381kuay4xk2OwNE1/npGbw
	UCZYqMIckIi1zph2hLJlSqZDpqbk3Wdbf9gNKzT2kgvqyQ3wLTn62UvyIolY6aIFAem9QI5VUP1
	cfFdhpp4uuw6v3F5GlSAJ4H3YepJDc/Y=
X-Gm-Gg: AYBFou1FGUHIeu198mPSLkE2BWso2q+XR0NbV214WpZJ7+qJJh51HJbDMmYQngLo2ra
	UOzMLftL2GO31okh783jTuJkF+it4PWrDVkUwWoJiaa1Mc61d+6Jb3wK5lZV81ae2dRRSsdqBNf
	2jt1R+cl0dqnlCdArkHdLBhPEmWaPpXAKgxxBxH2eYbf7sU231T2AzSstXnLyHw8VRq99ZybJB+
	que+GxX+rKKu3CJifyLmeo2/nJXuU3H3LnH7Rjd0cGGdYuoVSOkmufUt+/oMSxsK6qsA37fCAin
	Qhe31H19sV7BAtO/9+1Bx7UOiyjU4xFkHpmRBOw5JmX6
X-Received: by 2002:a05:6214:3389:b0:910:39e7:dbb9 with SMTP id
 6a1803df08f44-9103efbf07dmr36517936d6.33.1788475015314; Thu, 03 Sep 2026
 15:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANRwn3TWTHxP=ZEpgZzjRweC8vqifoi2koKgSQTEuPuY4FZxcQ@mail.gmail.com>
 <20260828033323.82958-1-98lawweijie@gmail.com>
In-Reply-To: <20260828033323.82958-1-98lawweijie@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Thu, 3 Sep 2026 15:36:44 -0700
X-Gm-Features: AcwNN1Uf8W0B_NasShubMPyX2tl_dv_s_spNFLKUekhbNr4EO8bPhewHWVRjrA8
Message-ID: <CANRwn3RFVDy+y-fpLkb1mfjiKyQgp1Jg0tyBTO+G0xem2s1jkQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
To: Wei Jie LAW <98lawweijie@gmail.com>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 8:33=E2=80=AFPM Wei Jie LAW <98lawweijie@gmail.com>=
 wrote:
>
> From: Wei Jie Law <98lawweijie@gmail.com>
>
> wacom_wac_pen_serial_enforce() iterates over a field's usages (up to
> field->maxusage) but indexes the report bits by j * report_size, the
> position of value slot j -- and only the field->report_count value
> slots reserved by the Report Count exist in the report:
>

Thanks for the v3!

I'm still finding the above paragraph kinda hard to understand. What
do you think of something like the following instead?

* * * *

The 'wacom_wac_pen_serial_enforce' function may calculate and pass an
invalid offset to 'hid_field_extract', resulting in memory reads at
incorrect addresses--possibly beyond the end of the report. If a field
in the HID descriptor lists more usages than its Report Count actually
reserves space for, the function's inner 'j' will walk past the end of
the field:

* * * *

Other than the above language issue:
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

>         for (i =3D 0; i < report->maxfield; i++) {
>                 for (j =3D 0; j < report->field[i]->maxusage; j++) {
>                         ...
>                         value =3D hid_field_extract(hdev, raw_data + 1,
>                                                   offset + j * size, size=
);
>
> hid_add_field() sizes the usage array with max(usage_index,
> report_count), so a report descriptor can declare far more usages
> than its Report Count reserves room for in the report.  One listing
> 12288 usages against Report Count 1 has the loop extract the usage
> at index 12287 from bit offset 98296 -- about 12 KB past a 2-byte
> received report.  The value is stored in wacom_wac->serial[0] and
> can reach userspace as an MSC_SERIAL event, making this an
> information disclosure.
>
> Clamp the loop to field->report_count, the number of value slots the
> report holds. Value slots past the last declared usage are still
> scanned; they reuse that usage (HID 1.11, 6.2.2.8).
>
> Verified on v6.12.105 with a UHID reproducer: a 2-byte report from
> such a descriptor trips KASAN before the patch and not after it.
>
> Fixes: 83417206427b ("HID: wacom: Queue events with missing type/serial d=
ata for later processing")
> Suggested-by: Jason Gerecke <killertofu@gmail.com>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Assisted-by: GLM:glm-5.3
> Signed-off-by: Wei Jie Law <98lawweijie@gmail.com>
> ---
> Changes in v3, per Jason Gerecke's review:
>
>  - reworded the explanation: the usage array is sized for maxusage;
>    the descriptor just declares more usages than its Report Count
>    reserves room for in the report, and the loop trusted maxusage
>    over report_count
>
>  - bound inner loop to field->report_count
>
> The reproducer is available on request.
>
> Compile-tested on 6ba2c27cb9aa (x86_64, wacom_sys.o); the runtime
> verification used the identical wacom_sys.c built as a module for
> v6.12.105.
>
> v2: https://lore.kernel.org/linux-input/20260825103104.12090-1-98lawweiji=
e@gmail.com/
> v1: https://lore.kernel.org/linux-input/20260822120926.153849-1-98lawweij=
ie@gmail.com/
>
>  drivers/hid/wacom_sys.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 0eafa483b7f7..40770affdbde 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -113,8 +113,9 @@ static int wacom_wac_pen_serial_enforce(struct hid_de=
vice *hdev,
>
>         /* Queue events which have invalid tool type or serial number */
>         for (i =3D 0; i < report->maxfield; i++) {
> -               for (j =3D 0; j < report->field[i]->maxusage; j++) {
> -                       struct hid_field *field =3D report->field[i];
> +               struct hid_field *field =3D report->field[i];
> +
> +               for (j =3D 0; j < field->report_count; j++) {
>                         struct hid_usage *usage =3D &field->usage[j];
>                         unsigned int equivalent_usage =3D wacom_equivalen=
t_usage(usage->hid);
>                         unsigned int offset;
> --
> 2.43.0
>
