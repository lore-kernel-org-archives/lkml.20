Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968594FB9CD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567670; cv=none; b=r5G7edHFxCPiujZTeAyoweECTrwdUKT1QKbGiKhQtqPDGq9LTd69ML4J+2M7qSP5mMiXWd2gO4rxS0EtNk61M/kIhcr3hAGtS+gJ2Z75TI5G4L630yvjJZDroYGH6YUIPtorsld2kc3Mpg7YXH4WcCrjnb6P+DxEBtIT3n23HMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567670; c=relaxed/simple;
	bh=2ryGNl6oXheRx8aq0X55UmksbIPQgAEgzorLvgUpZ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZwTXKmscWeFB+Y0IiD3VizmbUZepG0zlPFdIArDCYJHJCuonCz/WkUbSqEIt8Bl+R5k6tyPPjKxMPtuEByC+09HVwdDMPWDqiYoocPabfmeLJoy9/PjZGvYm89R17TOtJB3dsM5ZehRc+kZir9GHn5CJajnY2mMe8AK3Bgixdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ2ObqZ4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ2ObqZ4"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so9053995ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567669; x=1790172469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5Rra/PVcmzax9enHjnZo2f+/CC6GR4PQjiSRwVy+Jw=;
        b=SZ2ObqZ45OQX8DdeLymePHA+12+hn3haVx+uRwnbUQhSBkTsZGEKZbc7UR4uFGrzNg
         H+Tgjzd+6BSxcJA9Zl4d/5cj//8/EJGFQkpDqHrcQJe0/QcUP25DHf8vyYjFlxD1U7iX
         TCF1EdVgZZUPIEWIMuEm778jxImSCjEX1G8U8vTYToASvKyXuaDngld/An9gb3VAZEEG
         +zoYFS/0hHwf5YhLGRDdQBWxg6q1w5N6igwxmhxhLL+mdha6AlsSgWfgMeWq5d5ZxB1C
         Ryzwu+jpKKjNq5cUSYemTjrymJgHKevXV4sqVvdQKHIzaE2zTsA8LZQAmvjQ1iumP5fr
         rKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567669; x=1790172469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5Rra/PVcmzax9enHjnZo2f+/CC6GR4PQjiSRwVy+Jw=;
        b=LTQYeUtnIobw2R1lxLqQxUxoZ/6oEuXU7tadMimL7hJXy8YYWyaD5wivPnW/DmgFQw
         mUdLepYUzzpwT112+v113KrcMWKu7YI5W4wYWXuCKV7dn06OSUrDw9s/QggLo+zukLue
         bHVHhY03qbWMXKEgHdvMbpr6KICqOFa2mZiXrgWlYyxiioNhqQT4C/lUtbdKsadkqTC1
         45lHiIetnsNpIKcXIX/yZ/mKbTx7FXA/oCIoa3X/q2nhBWsXa/JVu2H7igohkmb61ASZ
         bD/kyARDccTZJcB9qS7hrWSbsfO+9uWbTFrs7WZ3nmMNSznuSC7eDkiZwDRu0Mfdi1qj
         DHEw==
X-Gm-Message-State: AFuF++mIe85ScHIHmSPVz8OMC2q+q/aCeJWJZvAnVbW2Eho0NDah9ywi
	zkeCaa+ForKdGOV+NhMw8+fojYfHNR2XgOB3vU+oCMlLc4+6bevhe+HRLz1Ddw==
X-Gm-Gg: AYBFou3m5pty2Mj2Zcc8et6Jbwba2FjqXkb2ImDxP1FXu2KCSXoqFM4ZqfnF7sUffzt
	q043l1SVPF6Towrba53GA+g7omueOAyNY+1zvvlRfsJKjkxCpoUP12mWTp0NIjwDiXOMjcHlQet
	SiFH6W8rSJQF4nn9yIXaLyDiEu6nnFcQocucAed3YtwAXBTPP1WTZrZNIMs6vJdNG9PeqsugV7s
	52/ptoyZmkHt95EKqQmKxxWxJqnFhiBszk+ATNQ86sNtNJCL/JHcgDRsgRHfdvOB9llWMVIBIzV
	17o5cjB/zry+KpxbTGW6UzVmoh6W6BuXCdGKzaWIoRdOo6YANyNR7MNk92gjCCfxM8UDyiCDaFQ
	3T9wgdpRfoe6l40IZAci8TTmQIUXIyObEtB+VKlY2vwGl/weiMSpb5MWJmoSQjkqLsiGdvK7UsX
	D7pxPvpLg6loU2bXYVcQLWGlblURJ/Bb6f4Xw4LOqdyYnW/aZYv65KsiA0YEv5JPVy+qyyslmTu
	ksE
X-Received: by 2002:a17:902:d4cb:b0:2dd:88b4:6920 with SMTP id d9443c01a7336-2dd8e784c69mr58010935ad.22.1789567668803;
        Wed, 16 Sep 2026 07:07:48 -0700 (PDT)
Received: from nixos ([171.239.145.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89edd1d5sm12622275ad.48.2026.09.16.07.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:07:48 -0700 (PDT)
From: Bui Nguyen Nhu Quynh <kaylovefoss@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Fix callback check in kvmppc_gsm_refresh_info
Date: Wed, 16 Sep 2026 21:07:42 +0700
Message-ID: <20260916140742.636708-1-kaylovefoss@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260907145626.7675e892-56-amachhiw@linux.ibm.com>
References: <20260907145626.7675e892-56-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kvmppc_gsm_refresh_info() function incorrectly checks for the
presence of the fill_info callback instead of refresh_info.

This can lead to:
- NULL pointer dereference if refresh_info is NULL but fill_info is present
- EINVAL return if refresh_info is present but fill_info is NULL

Fix this by checking the correct callback.

Fixes: 6ccbbc33f06ad ("KVM: PPC: Add helper library for Guest State Buffers")
Signed-off-by: Bui Nguyen Nhu Quynh <kaylovefoss@gmail.com>
---
v2:
- Resend; v1 was mangled by the mail client. No code changes.

 arch/powerpc/kvm/guest-state-buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/guest-state-buffer.c b/arch/powerpc/kvm/guest-state-buffer.c
index 42843eca6727..aeb586ba4523 100644
--- a/arch/powerpc/kvm/guest-state-buffer.c
+++ b/arch/powerpc/kvm/guest-state-buffer.c
@@ -598,7 +598,7 @@ EXPORT_SYMBOL_GPL(kvmppc_gsm_fill_info);
 int kvmppc_gsm_refresh_info(struct kvmppc_gs_msg *gsm,
 	struct kvmppc_gs_buff *gsb)
 {
-	if (!gsm->ops->fill_info)
+	if (!gsm->ops->refresh_info)
 	return -EINVAL;
 
 	return gsm->ops->refresh_info(gsm, gsb);
-- 
2.54.0
