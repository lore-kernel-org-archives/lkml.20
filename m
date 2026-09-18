Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A92C027C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741893; cv=none; b=Z5uSdnrvIoBzzfT8XASR0VPoRMMpKV9onQGzRuwJTTjgh1iRMGp83T4h1FQATCg+e01AiJD8Gykg3GnyVmlWl0QvUdgftZA42cJJ4P74hDWCogAN+YGl4DD7jSMHobjMbA5GDKfz/AJ9PKMoRFUE62M/3k+Llkh6/TTgCnT2n7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741893; c=relaxed/simple;
	bh=D772wZyIi2zII22vNrJ0r3ZaxDHDckPZJ+sviKougUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=De8FdH9eIYRPjDRjsvfxkRQOSbYJJ2pOVV57fwfVwCrbF380gEOh7AZn5y30RyqWQVyCZkP4hSj8ktocFZ98B3mcciaXikX4oE9t8t1MLI3HaTKw8tlN3G5quT0a8r+zHCnTF6g9okPoMBZhUWlxAGN2aOZfml1KrnVwNlTDous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzUOfgk5; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzUOfgk5"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso6071195ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789741891; x=1790346691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NOxqyYZTlsnROwyuOcMXRdlQNMNgyRf9TUPDZfpO7c=;
        b=gzUOfgk5luw0h4rtyCkcfx7E1U5evLoumshV3c72Y+HvQkored1lsLICRYbeycutqG
         21vvgEAREjmiA/iLz5qZxukPz5QYmwsTGFb3JAHPY9m0V75hR4e2lnlruMGZlbB1yD/x
         z6tP6HxmjHSagP4XHgT8DsQ2t0zgulRaUM/NfNP/Rn8L6tjWuRXg5H0cI7q8Swp/YTBZ
         09ULP5iqhS2dKjQE5KDsfXdYx40V8hMZ1mBDMLqyoOuiw+5LQI991p1XPFTz/pVoY3j3
         NqYej/kxBYm4A1gJoErvkcKrHBjMNOdCG+41vJN8cWi6ykwlx/fYx2/ebpkW+UTctpo+
         +exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741891; x=1790346691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NOxqyYZTlsnROwyuOcMXRdlQNMNgyRf9TUPDZfpO7c=;
        b=SWZhyNJo6RwcM5ydT6kSITuJ2QhfjfiPTFZeW52Bks1bh5+UfIGFaSJ1SN29G5q2o4
         PPVEn4tBcBFnSFlsGLRSVOpwjat4+onTVtUrjLGFzxYOBVuI3B3/JtOXvlekzyE4hRXA
         gFeTkk0B8EDh+FHlPGbnSb9VzKE/+SLuZe41wyq6a90D22xYbVaGu2bJXQXUxJQ8ZcMl
         nan7fmwmbx25bjs/vXxuCvQrG04F9GnC/HxIw4a/5nPEiYWFV9vNtCv0/x8KepnIQYzf
         npgJUWmJd/Im3FbhIaGxSZw3wWZ3yFXPXPaC0CLAvoLncIp1po2ovjPFOvdxLvfuGSPe
         gEAQ==
X-Gm-Message-State: AFuF++nhqMVKX1PezAeQtEkPZ65IN4lgM2lpSnlzkAOBL20qMtK2TeB4
	IJiyWv04fHSCtUHhtvsksHQrY3PCO6QpyrdOK8FVb6++csUEVq6s5X88
X-Gm-Gg: AYBFou0RMZ6dF6j0n5KyvoMXTXXwo7wlCH91Ydpy8ZBsArYaTFqpxfbYs7Thxyvl2jt
	j0IJSlXaJCmhgFK6QSG80NCmgXy8sjaNSi2g9Re5qgWNeFz2yB+mmOpTdhW0CuKqBbmCzonipo2
	nm2W1ep5al2I/8FAzc6o34NvdimRJFMYyz/FmKr8o5P748WBl6MmXifjok2Q0Fr4o0b67aL4QOZ
	dlJIqKvrS2p8lBUpKxaC/yucJhhYiww9009Nbe2cv0jB4CSCOHyh+flsgv4S7k/axT0At393a3b
	1RrHyrjGBDxQ8QKtCPeK1fpBRR2641aec/0IpqL6o42DpTSKpY+VTDnSGZp3aB+K0sdDJ4AvMY2
	xgXeJsTS/9H+6AT/ytavVlSkwNt4VUasW3C7+7fpgiF4bguUAUiefrZVxYeJwH1XyypRpqIYgNV
	npg/OWxfMXLkrRhuaSZNpZFo7Silk7kSEMZxoYawBTZ6SVd5NnoCRHzwPAEekYz7drL8BifIDpR
	fMjNgXLH0fPC28=
X-Received: by 2002:a17:902:cec5:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2ddb1b79d60mr56947675ad.16.1789741890428;
        Fri, 18 Sep 2026 07:31:30 -0700 (PDT)
Received: from nixos ([171.239.145.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7527947sm9188825ad.21.2026.09.18.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:31:29 -0700 (PDT)
From: Bui Nguyen Nhu Quynh <kaylovefoss@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] KVM: PPC: Fix callback check in kvmppc_gsm_refresh_info
Date: Fri, 18 Sep 2026 21:31:24 +0700
Message-ID: <20260918143124.9913-1-kaylovefoss@gmail.com>
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
v3:
- Resend to fix whitespace handling issue on v2. No code changes.

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

