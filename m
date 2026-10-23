Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792715261;
	b=M0/5m3H1nDPw5jUC1sia/U7u3nBRhh6WP+xNC11p9WzzS1icaCFLkcFIQce8zqIN+XLm
	 A6YOi4BOq1J+8PEIWDFNBPY9ZN2TAFAqS9E5PyHaEL3u/i+biIU5Xp7z91Dk7AHulO81c
	 5Yyp1yJFNRN9CB2dOiJwdW5Bn3CUGXmApYFoxrX9bOVmbARGm1gdfLDa+L4sFz4KOZcgJ
	 fe000mfav5l20Bz6F706M0EHwBRNkcQzSSuwm7OItFEvkNvazhFWVmiZNYZNVUXA6g+FV
	 VRn/RI5aYu4YeiEur6AbRD1nOrhv4S66a19jux7NqhqmM3UcZVXg2/btPHdvkD9moCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=pm5vW6+ujd/T3Jp6qSlsmMMIGHmE+dhdU3UAkNEbxAA=;
	b=1enepzycRcL5U9lqzCsV+pWo71X0M3MB7bnc3ahp++kt5z92WYoUNsJLv6OWeC0I+bkg
	 G38q1PAAxEKoWDqi7SHbXzdAYle78yKImIh2Xr8IIoAjy9/UwKn9zuJ+6bjT8YH0q39SP
	 YyrCLbo2r4le0CEJWrA/Ea645Nfrx/SOQOo1mKEZmf4l84S7UpQ+GO1FxGOstCzNh5jcR
	 CF5NDkWy6lJ4+iEdPrfz1qP+OoytAP+9G0MKPelIE1hP0qe7lRF+lPHtZecnQD5dJYroM
	 uXoJp5TYwENm9F05WcZ1UnkPbHOujtd1/RFpKpfTqNGN5yBSof4XtJbZwDUoY8Gr0fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XrfPgVoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71483606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71483606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XrfPgVoR
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b042c0759so194104f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792715260; cv=none;
        d=google.com; s=arc-20260327;
        b=mbaq+uj8rsASz4+DiQjnzprYoKv/Te6KWtJ3wxZxc1E/1IU5+j9EZQeQoLIUnLZqhB
         V4ziDkbcp3o8Q+SL1BS4Za7dczfKsSFSKoPqVLB1BEkC7u06hnNXvdaWTwDIktlFO/07
         +5ZQsxaGniG27GoAcSgH73cbAiTc7TP07AtMOadsyjPnk+o3nC0/F4Xxfu3eOUufHPPt
         CQwFmJPu0h70PGQsYTU/jrp/RCYmroj/k15j4OyhJElJI0u+MH9L165NjZoH49t16Wft
         nMO434P6dug7E31OUchjWieko2djexPmjVcAvNVueaWqrjPRbqz4Xd2S7wHsnJj5FL9o
         20Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pm5vW6+ujd/T3Jp6qSlsmMMIGHmE+dhdU3UAkNEbxAA=;
        fh=0j/7gLAxdV8bYvuVx+UE85qTerZI69MtWpCQ1QuHJX4=;
        b=kCX2UpL+ovfqiZcq1+lnoY1qmBEP1ESi4z/4MNyKv5L0X41TY0hyHqQFCkvjU0vogZ
         OkGrLk/1yVm5UvektNnRVGeN/JeAFbCEjraBiRS9IMD3uH7PnFvInDABB8dh/bImwuGi
         qo8NyGIyUYc9CJht+QUHEE7iL6p2ywt6yrlBIUhvCdkK3GYNkFk6LCC9YAsdzAm3OL7k
         UwYLhS/Ti17XTvshHMuhQIQyrXLKce5spLFSafeS8TqwcQK2BmRgaDbTeAn3KijFSue9
         pVJ5zKzxgMWB3UG8PaxbXhUwZNMLi9zpQtTvhN37KJP33VVGGukoGreIHjyJoHkY1SHy
         c7qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715260; x=1793320060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pm5vW6+ujd/T3Jp6qSlsmMMIGHmE+dhdU3UAkNEbxAA=;
        b=XrfPgVoRZ690/eV7JuTIHc/lddot231N2axusOP2nNqW3MOE1kehnATJZkGASKIFNc
         28TNHJGO1/GFVS4v816H9j9eQxykSeBQjwmsOE3wQLKuJg5mLUec9qutSOLAh7BxzeBN
         8Wyqx9YPHrqiqSz/6NNoirDISdya+AQrU6VNWBov+/szTpt4M6wA96XK+H8mrlFylRqy
         x6WD7NhHusn4yoklGhP4xCOph0EUNR/kTVFRVjCS0UM7ZVm1f+F81ydvDwovBTFiW3Ez
         67HPUGEXwhZEc+quj9K4evXGJLLTBhYkua2cR4RQDsVt+/d2awsiwtVRHFhMgYe264Y6
         zsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715260; x=1793320060;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pm5vW6+ujd/T3Jp6qSlsmMMIGHmE+dhdU3UAkNEbxAA=;
        b=grbSxF0+GUQrBA8xGdMWwgZFvNc92rOgn9+rmrKJAKk55HB+aVQp574ib8wsq+4MYu
         FhPhKtjqR1bbNKNDfU69ntr37I60PdkpxHRnuImHpXon6/rhbCxO96RttTSyOvnq0z0V
         Pwlc4RidCvfjjjei572KsFgmdf4ANNkeUzImi9f/GwrENJIskGtLglC9VqBO1HaAJraZ
         BIUSxxcfVa83s93al/CBreMUKZeTExAsNTfLEYOK/2LQkyzdiAM+hHsgrilQidoHAM1y
         np2rrBysRaEl03JVYp6GQnqaCKtEHk6wLzZl7qBIuPDNxzMWt8T3pu1rLxNH7VrCs82N
         zJ6A==
X-Forwarded-Encrypted: i=1; AKwUvBxd1fNaGvJghyXRuETLl8NbCw/mf9SaUbl92IIXOLYib6Err38wlqwFf1fqST24HLAbTQPBcg5v7+pvpJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl0ArGgmZw4qHRvKEfkXxc+ad4DVNalBtyDHyr4jkiPzcEtmAg
	b9EVQjz7X98+Ltu982b3BsWA9RId2MbHvMkB4FgLh+VlUfqQ8jAkGBs38zrQXR+cl07BIQcRIa5
	1J015SasWaeIaLc5wbEKDXZjCMEkS9dU=
X-Gm-Gg: AYBFou3JoYRTUJ3lHuoalR1LIwVzQda7PkYBmyYWv29Zabea9wct8EJW0qP6WrDBAZ7
	zl6CGOFYtsWFYy7VKn/21bhOQtdNmi/USFk7xkhcVC9zOr6IhFJKS34cgfg5lpxXNSTxqbBDna5
	eDmQuB32fRKcqn3XG1/8awxMHu7cnh4GcCUmHgSx2kFAjLYIThZFXmmYF9VFhO2RqtA2J/L5ihO
	04wb9GZYMjhtcyAOpsCsy5h8I5o+hD/PUl50gSoOn1KPtGSDQh1ILhF/KdER/gRfkYJn4yTgSZD
	aY5ESg5hb2Qwpjpetrty+vYQLR6xvv8B4aiZ105GO38hTq45T6TU7ArHVVkypKKyEeuQeVqhTOr
	FwOhg6X3h4mOp5yk1C9eR3VvpfXidqiaxO70=
X-Received: by 2002:a05:6000:2310:b0:48b:f93:3b87 with SMTP id
 ffacd0b85a97d-48e3859ce44mr661422f8f.30.1792715259541; Thu, 22 Oct 2026
 17:27:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 17:27:39 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 17:27:39 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jared Hooker <jaredroberthooker@gmail.com>
Date: Thu, 22 Oct 2026 17:27:39 -0700
X-Gm-Features: AclHuK86yoixlVm3vzD4CaxyQYWPY_UVQZ7lW8AWoOKc9kl0usLhMeTXtpquANY
Message-ID: <CAF4x=YaDUpjBZSmFZzX2FwE=6uzq8V-r78KSRwfg_=NX-buSAA@mail.gmail.com>
Subject: [PATCH] wifi: iwlwifi: stop peripheral polling when NIC access fails
To: linux-wireless@vger.kernel.org
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When an AX211 loses power across s2idle, RX shutdown can poll an
inaccessible peripheral register during PCI resume. The register-read
helper returns 0x5a5a5a5a when NIC access fails, hiding the failure from
the polling loop. Each iteration can then incur another NIC-access
timeout, although only the polling delay is charged to the timeout
budget.

On a ThinkPad L14 Gen 3 running 7.2.8-9-omarchy, function-graph tracing
measured 7.91 seconds in iwl_poll_prph_bit() for the RX stop caller's
1000-us timeout. The surrounding PCI resume callback took 8.26 seconds,
leaving the desktop visibly frozen after opening the lid.

Acquire NIC access explicitly for each peripheral read and return
-ETIMEDOUT immediately when acquisition fails. Preserve the existing
acquire/read/release sequence, mask comparison, polling delay and retry
budget while register access succeeds. This also avoids treating the
failure placeholder as a matching register value.

With the equivalent change backported to the affected 7.2.8 driver,
the poll took 76.24 ms and PCI resume took 400.79 ms. Wake responsiveness
and Wi-Fi connectivity were confirmed on the affected machine.

Link: https://github.com/omacom/omarchy-pkgs/pull/1493
Signed-off-by: Jared Hooker <jaredroberthooker@gmail.com>
---
Submission notes:
- Rebased onto iwlwifi-next/next at 3627924ed81f, where the helper is
  named iwl_pcie_poll_prph_bit() in pcie/utils.c.
- Hardware testing used the equivalent iwl-io.c backport on
  7.2.8-9-omarchy with an Intel AX211 (8086:51f0), firmware
  89.d2579d43.0, and ThinkPad L14 Gen 3 BIOS R1XET52W (1.34).
- Before/after function-graph timings:
                          before          after
  peripheral poll     7,914,548 us      76,235.97 us
  RX stop             7,994,772 us     152,336.40 us
  PCI resume          8,257,866 us     400,792.70 us
- Six mocked-transport C regression cases pass against the actual
  adapted helper. The original helper fails the access-failure case.
- The affected driver module subtree builds against the installed
  7.2.8 headers, as does the updated pcie/utils.o from this upstream tree.
  A complete build/boot of iwlwifi-next has not been performed.
- checkpatch.pl reports zero errors and warnings.
- This fixes repeated polling after access failure; it does not establish
  why the device lost power or identify the original version regression.

 drivers/net/wireless/intel/iwlwifi/pcie/utils.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/utils.c
b/drivers/net/wireless/intel/iwlwifi/pcie/utils.c
index 8aa43e5..0962df4 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/utils.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/utils.c
@@ -139,7 +139,16 @@ int iwl_pcie_poll_prph_bit(struct iwl_trans
*trans, u32 addr,
 	int t = 0;

 	do {
-		if ((iwl_trans_read_prph(trans, addr) & mask) == (bits & mask))
+		u32 val;
+
+		/* Do not retry register reads when the NIC is inaccessible. */
+		if (!iwl_trans_grab_nic_access(trans))
+			return -ETIMEDOUT;
+
+		val = iwl_trans_read_prph_no_grab(trans, addr);
+		iwl_trans_release_nic_access(trans);
+
+		if ((val & mask) == (bits & mask))
 			return 0;
 		udelay(IWL_PCIE_POLL_INTERVAL);
 		t += IWL_PCIE_POLL_INTERVAL;

base-commit: 3627924ed81fd7783394fb2555ea179c6606a231
-- 
2.56.0
