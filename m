Received: from mail-107169.simplelogin.co (mail-107169.simplelogin.co [79.135.107.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F0484258
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223875; cv=pass; b=Gl4MbYDzUED6ggS9EcyFPvRFm5vWebbLFTgtWzAAf2E/MwXONXT/kVQ6iOxIOF0Edb9xZhEEnIIU9hxuEQl/6kP01ExpHd1LaKhKbneYcobiL1qs0qLsfAhmrdjLBRLtAewOUHDl55XN8r2gm0HTbeXaDh85GpwoX6np1dH4twU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223875; c=relaxed/simple;
	bh=NFIkQmhlbzJ/YsOhhT3NdmkuOIS7JID42u1Q7hvnPBA=;
	h=Date:In-Reply-To:Subject:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=MH8/IlA8D/7uX7tHSyCSMRoMxZBgd5Jw9ZiyrN29eIL4q2Q1e25VVfItNqONNpruxwAlWszIkS+E6RjG8ItmlX8XnNb1lz48OXQ3/It/tfvzd9BQbDg1RJJO45TCtZ3A6uA4rfvbOGcANihGNJ9vnMBTEvkuxFeD0qzgy54wYuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com; spf=pass smtp.mailfrom=8alias.com; dkim=pass (1024-bit key) header.d=8alias.com header.i=@8alias.com header.b=nrZ8Pzl8; arc=pass smtp.client-ip=79.135.107.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=8alias.com header.i=@8alias.com header.b="nrZ8Pzl8"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1791223467;
	cv=none; b=QZki7uGed0tucPxLTI9njNGOs3PIVYZ9lDrtaHM0Fnr5C82Wd4uJrH9PFiVjclpbjg5H3bP4Om1Uo0ngCjZHR5wWCPTdvusD3JtaYsOSqY3lHfziB33WgMSEgZWf2/p+Bbx0NhApmed13eL30gEp2HT3HQjyttkGrV5USNdXacNGN2kfeCGYP5cEhtDYyhVzXo6qmjeDoTVQZq6g/5NfAPbto++8AB36WU2EXoNtZZc77EqbAJJjWGv4atO+o7qRSfTtSPd3Z6/dvBL3l+udSinmLxLvOe0QHJ4rpjI11Mhukhb8sl/ulyi4sNL89RH8UGxps5IQd6677eyQ9X5+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1791223467; c=relaxed/simple;
	bh=NFIkQmhlbzJ/YsOhhT3NdmkuOIS7JID42u1Q7hvnPBA=;
	h=Date:In-Reply-To:Subject:From:To:Cc:References; b=O28PBBXh8y9Re+q6VBNXCKNLa+KV7nPe2MPrxxMAEUkE86z9o+CTyGGkVKastWeW0/hU0HbzpBUYlfNgm/UaEJOsg95IJt09FFXPpi3HA/v7qewrruhgQ3J49ZMa5a9qnTHiR76EO6sD57BP1nOUKVGd2MnZuAdnQPUnsdmb9ovXWpKCHCmCjUPv1w2bXh0ZkDabgtpR4HqtTTQZ05BoBO+IBJCd4crZvO5RfB6RjinqTRa6rTGuS5yjjnp/RTccs2JZzdeLmvUPK4oHK8Ds0NMoa2BKLM5FgyH2gYcYbLDJhLoJzhez8l9rkAeaEjzG4dfV55oJ1QcM7j0AriMx4Q==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1791223467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFIkQmhlbzJ/YsOhhT3NdmkuOIS7JID42u1Q7hvnPBA=;
	b=nrZ8Pzl862B7V26B1EsXrdYjkrczlFZb4nhdLTB5YNxWuAEXGA+u2/JTAb43couqSELe4q
	QIPx5tA8wnpOL2/nv0A5QQjut61ZoyK/b6k/heGB1Kn+F+BgAj8OciOYM4iAyygvDb+KKd
	BFKJj0iwVEayDudWtXe47kClD7deHZQ=
Date: Mon, 5 Oct 2026 20:04:23 +0200 (CEST)
In-Reply-To: <P3C8cUq--F-9@tutamail.com>
Subject: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: linux-kernel.supreme403@8alias.com
To: lkml@antheas.dev
Cc: tiwai@suse.com,"Ding,
 Shenghao" <shenghao-ding@ti.com>,perex@perex.cz,baojun.xu@ti.com,kevin-lu@ti.com,sen@ti.com,matthew.schwartz@linux.dev,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Message-ID: <179122346529.6.9250312386131579603.1671009695@8alias.com>
References: <179122226568.6.10663878730330541363.1670962442@8alias.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1671009804
X-SimpleLogin-Want-Signing: yes

Hi Antheas and sound/TI maintainers,

Resending as plain text because LKML rejected the previous message for cont=
aining an HTML part.

Your January 7 patch fixes barely audible speakers on my ASUS Vivobook 14 F=
lip TP3407SA_TP3407SA. Could it be revived with the hardware evidence below=
, and considered for stable backports after upstream acceptance?

Hardware: TP3407SA_TP3407SA, BIOS TP3407SA.308 (March 5, 2026). Tested kern=
el: Linux 6.18.46, with your original patch built and booted. DSP: TAS2XXX1=
0A4.bin, identical to TAS2XXX10A40.bin; PPC 0x19500, classified by the driv=
er as TASDEV_BETA.

The CRC-valid, 88-byte CALI_DATA UEFI payload contains two speaker nodes an=
d custom address node 0x80. Its address slots, all in book 0, are 0ce4, 0cf=
c, 0cf4, 0ae0 and 0d70. The firmware metadata instead orders the first thre=
e destinations as 0ce4 0cf4 0cfc. tas2781_apply_calib() reads the custom no=
de but only installs its addresses for TASDEV_BASIC. On this BETA firmware,=
 two factory coefficients therefore go to the wrong destinations.

Primary speaker factory words, in order: 3db90308 3076f45a 10971fdc 00a17a0=
f 2a800000

Actual primary-amplifier register reads, book 0:
=C2=A0 Address=C2=A0 Before=C2=A0=C2=A0=C2=A0 After=C2=A0=C2=A0=C2=A0=C2=A0=
 Expected from factory node
=C2=A0 0ce4=C2=A0=C2=A0=C2=A0=C2=A0 3db90308=C2=A0 3db90308=C2=A0 3db90308
=C2=A0 0cf4=C2=A0=C2=A0=C2=A0=C2=A0 3076f45a=C2=A0 10971fdc=C2=A0 10971fdc
=C2=A0 0cfc=C2=A0=C2=A0=C2=A0=C2=A0 10971fdc=C2=A0 3076f45a=C2=A0 3076f45a
=C2=A0 0ae0=C2=A0=C2=A0=C2=A0=C2=A0 00a17a0f=C2=A0 00a17a0f=C2=A0 00a17a0f
=C2=A0 0d70=C2=A0=C2=A0=C2=A0=C2=A0 2a800000=C2=A0 2a800000=C2=A0 2a800000

Before the patch, the speakers were barely audible even at 100% system volu=
me. After booting the patched kernel, speaker sound was normal. The firmwar=
e was unchanged. Protected Speaker Profile Id 1 was active, with Program Id=
 0, Config Id 0 and Force Firmware Load off.

As checked on October 5, mainline 67f0943b394d and sound for-next 8acd6469f=
427 still have the BASIC-only assignment; the patch applies to both. A loca=
l userspace C test using the kernel's calibration routines and mocked regis=
ter writes reproduces the misplacement and verifies the patched mapping for=
 both captured speaker fixtures. No-custom-node, BASIC, already-matching-la=
yout and invalid-CRC cases retain their behavior. The test and captured dat=
a are available on request.

Limits: only the primary amplifier was read on hardware, and the final regi=
ster snapshot was taken idle. The listening result is subjective; there is =
no calibrated SPL measurement or controlled same-volume A/B. Current mainli=
ne and for-next were not built and booted as full kernels.

Unlike the January Ally X test, this machine's OEM and firmware layouts dif=
fer. This report does not claim to fix the Ally X's separate symptom. Commi=
t 4fe238513407 introduced the custom-node parser with the BASIC-only assign=
ment and appears to be the appropriate Fixes target.

DSP SHA256:
=C2=A0 a29f522c22cdb203eb1af84846838b5ef76c3a2c721760c7a898dd35f9ce1430
Public firmware:
https://gitlab.com/kernel-firmware/linux-firmware/-/raw/20260410/ti/audio/t=
as2781/TAS2XXX10A40.bin
Original patch:
https://lore.kernel.org/all/20260107093134.583873-1-lkml@antheas.dev/

OpenAI Codex (LLM) assisted with diagnosing the quiet speakers, validating =
the existing patch, preparing a local reproducer and drafting this hardware=
 report. The kernel change is your January proposal.

Assisted-by: LLM

Thanks,
assembledev

