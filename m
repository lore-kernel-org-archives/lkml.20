Received: from sender5-pp-e106.zoho.com (sender5-pp-e106.zoho.com [165.173.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687A261B9E;
	Sat, 26 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447457; cv=pass; b=YZ2j5b7/OF8EaRl8u2yGJ7c9eSOwExvCABJlkQHVm5rhUF1/uA0+Nex7lfrULbHnZN7yCXCZtMzB+Brn59qpAJUMTi9itApWrCnEFw14GP2+z6UBJWtJzZAZitDVj9cxYFRZGfHW3AI0dziUzsNMPXhjI0NSmYnjlkiCE8SPK2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447457; c=relaxed/simple;
	bh=4PHW3Eo2viww0JvJE1mAzFr6/DfBWETPmCDLuXl3Rko=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p5EzcFbarywR9iPHyxBwfmK06oNnwijjwTY/2ss40IEb2E9cChFyUzbbkrfeM2S+L8Cjf7lA79osiD5q3ltx9wLSPyFaV3ixgcQg4NSo7eatiKF0/d+b6xPGDzUZS8KRqgNZnbVokGaw7PPISUb3TwhXIPW608cPWfK0zCrorcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Q1mjfQIw; arc=pass smtp.client-ip=165.173.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Q1mjfQIw"
ARC-Seal: i=1; a=rsa-sha256; t=1790447428; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JCI4FJnY+tDdh6G0n1+B773G31oYN99r4XkaSRVnqsqKbMKDlM5W/Ko/ffYfOn9SRzUI8ehULiMHSw2iDnB6w81aGoPnbSGs+P1iH0epxC4eB9UwPKWmZcuNeg5bRMz0l4ydyycFHN/6HkSZ20jbHaCHBGtDSCjwL9OEwT5tBt0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790447428; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4PHW3Eo2viww0JvJE1mAzFr6/DfBWETPmCDLuXl3Rko=; 
	b=BCDFMZH0/MvpUZNlU7jnqc4sMZgXL8LAutvJ0o9W1IHGRLRcYWAZrsbk1MrCkbhOqnT+j/O/z/a7D/d81rysvAW1Wmh4kqfE8XaWemTxQtMgAjhXWYXnu9pORorYRTQzrBMjwpCJqzvC5YRLlqwhyfwRJ8D6vvBf8CJuFPkoP64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790447428;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4PHW3Eo2viww0JvJE1mAzFr6/DfBWETPmCDLuXl3Rko=;
	b=Q1mjfQIwDqIBPaAG1HQFlh67x9nWyHyUp+4pntTjYB8Db5kGg2i3lvRbeO9NggGY
	vW11SR4LFU41ipWjJMvPdGq+7O1o4Q4RsAE32votvIfdFjLCwL5nK2PP03r/ThFAqxM
	KF9LIXgVmfKbcVynTd9J+pONRRBZ4KMutK2usbG3zDP9Z4b0qNeePhLqjQR/eA7B1kP
	BH06jOCFg82E7y3V7jBJlqdorDGq/Uf8rdiIS8i8p6Eh9F8Dnx9BF4OrunXoXaUuT2S
	TNTjGs94/kIvPbkdQJwrLk/puvOX9Hrk79feNpZodoQ7DMs6nOPptramq1KzopNyTI0
	hmMa7kYIQA==
Received: by smtp.zohomail.com with SMTPS id 1790447427547685.9333117180373;
	Sat, 26 Sep 2026 11:30:27 -0700 (PDT)
Message-ID: <98dc534b684e3301bf30c9d7a3e97196f7eff4d5.camel@rong.moe>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky
 GET_CUR
From: Rong Zhang <i@rong.moe>
To: Faaris Ansari <faaris.ansari@gmail.com>, tiwai@suse.de
Cc: adventureFAN@gmx.de, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, tiwai@suse.com
In-Reply-To: <191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
References: <87h5klw6kp.wl-tiwai@suse.de>
	 <191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 02:25:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Faaris,

On Fri, 2026-09-25 at 19:33 +0100, Faaris Ansari wrote:
> Hi there,
>=20
> I am continuing to have a bug across the latest 7.2 kernels, as well as=
=20
> 6.18 and 6.12 LTS branches concerning hardware volume control on my=20
> Audient EVO4, that I think is related to this issue - would appreciate=
=20
> some guidance if not.
>=20
> Specifically, when changing volume via the knob on the front of the=20
> device, everything works perfectly, but when modifying volume through=20
> pwvucontrol or wpctl the volume drastically lowers. As far as I can=20
> understand, pipewire is resorting to a software mixer for the device for=
=20
> some reason, whilst also actively modifying the hardware volume at the=
=20
> same time - is this what should occur with "sticky mixers"?
>=20
> prior to kernels 7.2 (tested 7.1.13) the volume control works perfectly=
=20
> via wpctl.
>=20
> I attempted to add a quirk flag to snd_usb_audio to work around the=20
> issue without success:
>=20
> ```
>=20
> sudo modprobe snd_usb_audio quirk_flags=3D2708:0006:mixer_get_cur_broken
>=20
> ```

Nah. This is not the proper way to specify module parameters. It silently
succeeds when the module is already loaded, without actually modifying
the parameter. It only works when the module has not been loaded.

It's more preferred to write the option to /etc/modprobe.d/, unload the
module, and probe the driver again. After that, check
/sys/module/snd_usb_audio/parameters/quirk_flags to see if it's applied.

Note that while you can modify the parameter through sysfs, I don't
recommend you to do so, as it can't handle line feed properly.

>=20
>=20
> I also tried applying these patches to add extra mixer controls to my=20
> EVO4: https://lore.kernel.org/lkml/20260919151840.24371-1-arc@gmx.li/
>=20
> This worked fine after I modified the UCM conf for the device to follow=
=20
> the new (correct) naming scheme for the master volume, but the volume=20
> problem was still occuring.
>=20
>=20
> is this problem I'm having related to these sticky mixers?
>=20
>=20
> I originally reported this to wireplumber thinking it was an issue=20
> there, more information is provided at the link below:
>=20
> https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022
>=20
>=20
> As I've never reported anything upstream to the kernel before, I'd=20
> appreciate extra guidance where necessary. Would love to get this solved=
=20
> as its making all volume control on my system unusable, and the change=
=20
> which has caused it has also been pushed to LTS kernels,=C2=A0
>=20

No, v7.2 is a *stable* version instead of an *LTS* version.

> leaving me with=20
> no working kernel besides reverting to the now EOL 7.1 series.

Please test v7.3-rc.

Thanks,
Rong

>=20
>=20
> Faaris
