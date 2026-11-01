Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793571508;
	b=FJIfqf7wTqy1zYxMXvR48BQOol6aTH22l287GgH0CK4vA5wjlr64A2cWBznqYPTU5cUi
	 zi2QVR/Uf4ZPBgJe8HR1VxUXQupVbHwQJOHJ2ZobLeuIJ+Z4I7nFALMF0RJGjsxVQcr96
	 lYrmvtPOAaGQ8qFHqlx9eTvqc8imsPI3acXQfX5v90OqsELq2Iu83DfBGSSw2BhchwkrI
	 6KUHjeFw/xK6T0RLHTWSyhqpMmnYqhHuxbcO5W/bEYPRdMuaBbnT0E3TZ2yhSCiIByCBY
	 bvWtXdGgVnpiRr6VT+dRsOL1U3RnqhigEEZL5ybhXRWrP2eI9U7t/uXawwYI4l3cXXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
	b=Szmp9UE9d0jN7gHeye4fZB/OmEAuTixTVyP+aEQjNMk5s/mw6BDq2UHOADzgItUkJj9P
	 /LpiLve178GYnvkIpV/f9Wk8UVORvJnDyvYQ1eRE3jgt4HM2+mY0OGoY0KZECDRVbckHo
	 ooHNcUeipjVX001KQJ0GcLSMxZtXXsHSN2xjQJjsN+Y8n1P/Oeq8PSFPkVMffTWI3vcfx
	 2CK2fvmD36hoHmPO4fOAAZoMZiLu7whEUFnmkkP3FWzy7wc9/r4EAyMR2E8oIslXWr2k6
	 uM+zw06qBCx8XiKAfZ1ZZ7o3tsu7lp2kHgYfbNfIBa8qCGd7S3wmxiRAuaZjJUTl3SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSrFqsKz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A10606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSrFqsKz
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so3872418a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793571506; cv=none;
        d=google.com; s=arc-20260327;
        b=FEZChJpWnBuVXNsTXfTC2CegD4Gw9pjycGdut35WdBHd376Y/Hd9FtGId8rA5z7DUh
         RT/PwZIkySsm+GeD28f60ZMCXAjDcxm64QdtwrKMSpjherBphyFLhbC15Mf03jTz3yxl
         4mmaIow6HVP1bMOr6g9AMKY6OIkNFYSBY2FsEmSn5vl5uNVUh9pYj6WQJ/8HROJEjXpz
         S42fGkuTEUw7tZMP/YkVDKYR1WZVny/mVwwrxcnFR/9aCK62PZmqa6ylYoDE2Upvh7kr
         NJ14wt0qB52dtVv/NlQii5zavrP87zB/UNGbCHP/x+IdUxxouj+qzfWuMBcHEj+ZUTJE
         iB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
        fh=X5odUDsnNJt/2ukmGr2aJa0qNFgCDvi5W9+uS00dAmA=;
        b=pf1MapcQltA5INr3RiYepJlaHc4OmS9W2ZJBzoqt5NB2SzCN4bRSIW1W8inkz2pJAR
         32grDKuCWdgjKlzpk+0EzToQ/TzM0rRoTIkr9jIHD0BmPaBk4AN4eYammYHV2XSvGsRC
         W8NVE+suiXfpsnGyHriBPOSE/NzvrCAm1TQVhrR5kLlKRMfxmbhgxk7GVcClVZQ3oIZg
         iRN+Ca/sZfxQ4NIMT8+Ovf4pbKMovpwZpt5owmvDYMfaYwKDtGZRBZFFFFBlSmkF/STM
         2R0GUWA5Us3yjMzORaQ19/GguVl+TYIZSSm6biDNFkQrTTyM4RGStQgxiLRPWLilAmmt
         /oFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793571506; x=1794176306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
        b=fSrFqsKzpDLjiUDXBr+/tqqXCn3/IZ0KtRDNSZnbZwic5GYqgD50nfhxzH9Jn+cMDH
         PBJjOi74lDvjR2XvNXaxvmb/3Ui3i3YZucBUP9j1xFZTmLLP6QWiOMXGZOhzeyjZ6eIX
         C19pgaVL4VBxsOW4dMWViVxtLpRk/1YtCReQGmEE+AkpgBgwb+P7rXrQ2vDULO3nwiZh
         Gut9DjGCPH3U8CHkt5Yio/m+qO7ZRubOkpMHpm92LegMJlE7GFrJYXZfNlZ5jcZJSI5G
         3uPGW53AJGykdKmbuU/BQgqrdKvI3tCeDkKL46f5pJMPnPnpaF/GsX1jIon77qLd8cxl
         rshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571506; x=1794176306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
        b=VHQs70UuNnLjoQK1csjntHKy1cVI2i7yefyf3sEp+k3iiNcK+h9GVxP/eAiLA9u4Co
         +WEuQehhNWApf5mQjSyqWSCXWFVjyFjqlYGnhcN++S7a5pa/vfLfVt4rsTA9N6j4ypCT
         stFpFCzGYsSxp1RzKjVnprb/3eUlwEetq5rkv0pymHjfbjGX+d9I6kVSAqtXqua+7m6i
         p25wa9nJ26uSqXsxesql+EjYcADOd8V+Nmj+MKG2cekPGZT9vvuxn95ktTIRKFHdgLaD
         CxEMO0OUzXbST4QwJvsewjkivQHMR1co0+/pmAPJwbHRvbp+NrY02zHRqMig2Wd0JirI
         zgrA==
X-Forwarded-Encrypted: i=1; AKwUvByAIrJ+LTi32wI98iMaXvTIIaMIc06Gcd8NsPfan0VdE+5BRQmOHlpeLh8if8yNp0EQ5bPaH2Df/44mjWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XrGTYXS6W/ivFsU1d6ZsE7A9Hiv9RBtd/ifeQsRSwiP4QIzMy
	Hy2FM0D3pYzafaZ1V7yhTfdau2y4mISAa2mN5LajAFKr2FXfyPbEZiYQIOphQM/toLCcSpf/OPK
	OuLXT+EkTLC+IKC+V9ZYXBZLN98hQB/k=
X-Gm-Gg: AYBFou2KqaLcWPu8Cm6noJReRoHlU45LsmrLcglyWEaIzQQxJk6+616+1Bx6RWTF3AB
	aqixDm7s7jbqV5R2JoXQzKc0sHHQYv8NWFkNqnvCDkE3PRRQE6XcMw1pPAwpX4ejFgBsA5eXx6M
	RwtpsRBBIfimPsWf0bRcBNmgV2wyVO26aOxb/nkm4Sk5AEOGVQrqmbWN3m/Txe1Kcep881xhyiP
	fVIO/+PDdqBDMTpeJ4j22Braj8Wz/iWaOle3XO3Z3lu4XUJL52HnK3IuTRhFCw1AXm0VVtoXVDH
	mZ3YMZW+yNe5umBj0M76aXsAIqYHl0NXxokEJbi4MQbM95FKxAVn7jBmZotFF7t9wzfar54NTSp
	Dp00hOBuoqDlrMxUPxxMpQR7Grf/OtSH/+Dt4QpKALqLTdqv12zzm3KjtS+w=
X-Received: by 2002:aa7:c24c:0:b0:6b4:5a0c:a7fc with SMTP id
 4fb4d7f45d1cf-6b4d4d738ffmr4199376a12.26.1793571505882; Sun, 01 Nov 2026
 14:18:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: yo@miguelrevilla.com
From: =?UTF-8?Q?Miguel_Revilla_Rodr=C3=ADguez?= <migrev@gmail.com>
Date: Sun, 1 Nov 2026 23:18:13 +0100
X-Gm-Features: AclHuK-c09-4rAv-gYdZmBcBJqHP3BI3ufjPXwPmJjbaWNLmFjNpCpjVHq1C_pM
Message-ID: <CAG9fDsV01JJx6=xbts1XJ3+utG5yzys5BqJ5UcHWp6-_wDKpxA@mail.gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 16-by0xxx
To: broonie@kernel.org, Vijendar.Mukunda@amd.com
Cc: linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com, 
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The HP OmniBook 3 Laptop 16-by0xxx with board name 8EE3 does not
expose its internal microphone with the current ACP6x machine driver.
The ACP device is handled by snd_pci_acp6x, but the machine device
remains unbound and no ACP capture card is registered.

Add the HP 8EE3 board to yc_acp_quirk_table so that the driver can
select acp6x_card and register the DMIC capture card on this machine.

Assisted-by: LLM
Signed-off-by: Miguel Revilla Rodr=C3=ADguez <migrev@gmail.com>
---
Based on the ASoC for-next branch at
11ae63bd9030349a0136fb2edd1622a4a029edc8.

Hardware inspected on the affected laptop:
- DMI product: HP OmniBook 3 Laptop 16-by0xxx
- DMI board vendor/name: HP / 8EE3
- PCI ACP device: 1022:15e2, revision 60, subsystem 103c:8ee3
- PCI driver: snd_pci_acp6x
- Kernel: 7.2.11-arch1-1
- acp_yc_mach.0 exists but is unbound; no ACP card in /proc/asound/cards.

Validation: git diff --check and scripts/checkpatch.pl --strict.
The patched driver has not been built or loaded, and microphone capture
has not been tested with this change. Running-kernel headers are absent.

AI assistance: Codex helped inspect the hardware identifiers, prepare the
DMI table entry and changelog, and identify the submission recipients.

The same quirk was previously proposed as a GitHub PR:
https://github.com/tiwai/sound/pull/8
This is its first submission to the mailing list.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index ae2652445..f7a1b8b8f 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -766,6 +766,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
  DMI_MATCH(DMI_BOARD_NAME, "8DC2"),
  }
  },
+ {
+ .driver_data =3D &acp6x_card,
+ .matches =3D {
+ DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+ DMI_MATCH(DMI_BOARD_NAME, "8EE3"),
+ }
+ },
  {
  .driver_data =3D &acp6x_card,
  .matches =3D {

base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
--
2.56.0
