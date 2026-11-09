Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.241.220.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252858;
	b=pYH3EHubBlcZ8flI2avGht2lHPUDJLviwOHlC9mU5/VaQPSf79T6kVHLgt4b7DnIju3F
	 pbOyy/H04WA48Xnreodr0tWrljLfooZTzzEFUBsOx9nT8BBAwFvOx1j2MvqnniNkcJYfv
	 H98trVGrD/VlcEm2GuZRoC8+Ma6SwOarY2rJrHcnMIuK1SK/V1X5rAfF8IWVEft4j20uN
	 utljRwEctmYYAsLjTwoXT3Y+IqN2kZjHd5lqJ/f4wCjztGh2AuQLEOgJKbtYIeKvWm8Wp
	 uY8jDlQ0UXv8VTZSODZv7D4zxbCR83SY0zIly3LSA1L+5lLErLE47lUgqS8idjStQnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252858;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:From:
	 Subject:Message-ID:Date:MIME-Version:Feedback-ID:X-CSA-Complaints:
	 X-Maileroo-Ref-Id:DKIM-Signature:To:Content-Type:
	 Content-Transfer-Encoding:X-Tenant-Id;
	bh=+GjJ2slK0PGAyv1yIQM1jKzuh/MgUhbUiZsMzHVrrjE=;
	b=h7JYISSEYgjH+S+79zQh8os97uVe2Ape7LLsklnd+0dh0xJxtMxhIOyRsXUFlSupAKRb
	 Tj3YI0UIuG7LFTImrvQ487HbxcmcO0WTjfbm5oDHs8lxS2Zm0vEljaLPGIXBbnl07vQbz
	 q+p5a/nSv2QpbflU0Hy2VIxpq2EDwjPql7f6ogM624AIBPEEnVK3MvBopIk9/N8nJKQgp
	 /a/26+FnPGSz6X0udA00u9w6oRdpy3mRy85c7atQi5Wn8s/eApXcfWBnFyiiuY3T7JzHI
	 YviWfb261u/gi24zhlkQRDuGonZ6xmtRFZazwcoLu8bC0R2YaOuyLoJBmGOPt9CN83Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=WoSjTsHM;
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=PO5zxuZc;
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b="Lu3x8rp/";
	arc=none smtp.remote-ip=188.241.220.14
Received: from mta3-26.maileroo.com (mta3-26.maileroo.com [188.241.220.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79201606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79201606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=WoSjTsHM;
	dkim=pass (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=PO5zxuZc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=Lu3x8rp/
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=+GjJ2slK0PGAyv1yIQM1jKzuh/MgUhbUiZsMzHVrrjE=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794252850;
	b=WoSjTsHMw1DVE2TIGze/UjNfau5kq6rjno9ESjvMsV30Zu38qEbsp6B/+aYSn2nKLQUakRA0E
	PrXJ9njxigu0ofjDIgw3ZL30brdkoMBAIi1j7Cemn5NjezlXTdNEpcPp3dH3oB5E5n7NWhaqoLd
	YsMqU9aLASp5G5/RUU+6vP1ZsFYDwJl6GfW6m/u99eqRQ2kM4uL3F4SKNBfriEIlaY/cB+GpNTZ
	vfiaUTvZjIcn9vLvCcuJx6IY9iUFl/WOIbw/Hm1EDcjeLxYOV8fpFf+IT3rxOlmEAVmIdKYmejB
	EcIbL0CnBDOstfwQP6swWfs4nQEruvWETFJHEb+iGssw==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=+GjJ2slK0PGAyv1yIQM1jKzuh/MgUhbUiZsMzHVrrjE=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794252850;
	b=PO5zxuZcYiFvnA/uqTkfCrhE/eSdLvnBmTNb3tCmZK62F6PQckMM9fgT0DZZfAIika27ZVeUh
	QhFB/FAc+pY5tp8nyCytLIqomzJtE7Q6ZSZ3+bgZGs5S7TejshMw98yUeRHw7EhGP2avzV11Vmy
	518KcIlUxdK2DrPSzH768Vnrzc/8XUn9znL9DUeSXZb0U7hclaeNFb5vyaQrdqHtqqyqxAsXVJG
	WlOvsYd3bClejMbhQ5IlI/FIMDPhxQhGlkzvYZ6MclmHR4+BXRmi00ZSWSliL9VKpNGuAW9q8nI
	yQRh0QiSYLT1KlJqu1xlHXDuquSQV1ZT7pao10n46bBA==;
Received: from localhost (127.0.0.1)
  by mta3 (KumoMTA 127.0.0.1) 
  with ESMTP id 89639a06dc7411f1844792000677b433 for <linux-kernel@vger.kernel.org>;
  Mon, 9 Nov 2026 19:34:10 +0000
From: "Dario Ackermann" <dario@darioackermann.ch>
Subject: =?us-ascii?Q?[REGRESSION]_x86/microcode:_boot_hangs_bringing_up_f?= =?us-ascii?Q?irst_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode=5Fld?= =?us-ascii?Q?r?=
Message-ID: <637294860202304203756989.6100.2026119193410@darioackermann.ch>
Date: Mon, 9 Nov 2026 19:33:43 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Feedback-ID: u56201:maileroo
X-CSA-Complaints: csa-complaints@eco.de
X-Maileroo-Ref-Id: 5efc4db390cbbe4f2d96e06b
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794252848; bh=+GjJ2slK0PGAyv1yIQM1jKz uh/MgUhbUiZsMzHVrrjE=; b=Lu3x8rp/dXwyjagPtSlG2B7nj4T2opYLcfPLBJaohqJxDGZm/a 900N2Bp1WzPbVK9+oc6AqngvoMeKZrw6rOjr7CnvpKxhrzB0/Ua0sbjdtZVO7NnnIbfijP36vPw XVUMMIGoMseQIh5GQd4GPtFCMB+oAA6qfkKhzPr+lZ6Oi0byYCGux3kVcz96SovRd6LlncyoaIj WAgt7DITc8HgpF8aqHS9CRlpGjN1hf744NUisYAvNMXGPqKSCcZ1rwzPO3LghlwqhBbgeg46Gcy XD2Gc0/4pcSLzrq4Loikh6+zMfKGJ9Jln3/10s04u7TlpSHrmgOZ9loBwmiry/qisIw==;
To: <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Tenant-Id: u56201

Hello

since moving beyond the Linux 6.1 LTS kernel, my ASUS N552VX laptop hangs d=
uring boot

while bringing up the first secondary CPU. Booting with dis_ucode_ldr avoid=
s the hang, so the problem appears to be in applying the microcode update t=
o secondary CPUs during boot.

Kernel versions (Manjaro kernels, vanilla not yet tested):

- 6.1.189-1-MANJARO: boots normally (rarely, ~1 in 10 boots, it showed a si=
milar black screen)
- 6.6 and 6.12: same hang (tested earlier, not re-tested in detail)
- 6.18.55-1-MANJARO: hangs reproducibly

The intel-ucode package (20260925-1) and the firmware are the same across t=
hese tests.

Symptom on 6.18: black screen, no journal entries from the failed boot.

With "loglevel=3D8 earlycon=3Defifb keep_bootcon" the output stops while br=
inging up the secondary CPUs. Last lines:

smp: Bring up secondary CPUs ...
smpboot: x86: Booting SMP configuration:

(the output ends after this and the system hangs)

Boot parameter tests on 6.18:

normal boot -> hang
maxcpus=3D2 -> hang
nosmt / noapic / intremap=3Doff -> hang
nomodeset / i915.modeset=3D0 -> hang
cpuhp.parallel=3D0 -> hang
acpi=3Doff -> boots (single CPU, ACPI hardware non-functional)
maxcpus=3D1 -> boots
dis_ucode_ldr -> boots, all CPUs online

After booting with maxcpus=3D1, onlining CPUs 1-7 at runtime via

/sys/devices/system/cpu/cpu*/online works, and all CPUs then report

microcode revision 0xf0. So the update itself applies fine at runtime;
only the boot-time bringup path hangs.

Hardware:

- ASUS N552VX, AMI UEFI firmware N552VX.304 (2019-05-08), no newer version =
available

- Intel Core i7-6700HQ (Skylake, family 6, model 0x5e, stepping 3), 4 cores=
 / 8 threads

- Microcode: 0xf0 loaded by the kernel; firmware-provided revision (dis_uco=
de_ldr boot): 0xc6

- 16 GiB DDR4, Intel HD 530 + NVIDIA GTX 950M

Full system details and the original discussion:

https://forum.manjaro.org/t/asus-n552vx-manjaro-linux-6-18-black-screen-unl=
ess-maxcpus-1/191095

I'm happy to test a vanilla kernel, bisect between 6.1 and 6.6, or try debu=
g patches.

#regzbot introduced: v6.1..v6.6

Thanks,

Dario Ackermann
