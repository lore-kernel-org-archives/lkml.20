Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848920;
	b=ReCZ6K66YKKblvhlBPlbiobM6o9ysnBkvvFDBBMC7vux26bnL9ItRoKWkdRQqYKleNjH
	 Dhe9pW9W+f6Kzj+FIxzrTqj6+EAJCN9/pnR7tSxSi9nPwiMNqElMiL30XR4nNPqHZ7jde
	 4esUoH+Omy0rhbkW4ENm6MfiOjvYGhdBc+6YBMhmtuGosySOnRmPx9WbOypEoIyrIEZju
	 AkY+BKDiAi5dxv9iZUABxC8vDTlRWwC1pTFP7Z2HuE4WOKLLUFN1KW27nBncv9T6nR7B/
	 I7sxtg/4eVVSphKwlhjXW+LjCctqPvqSKZ2SaytZswlOfUNBpM0ug6A/Ht1MHhyLhSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
	b=Z4dxk/T3MYtxxlkfjgGrU5v72HKjv8HDsZpz9r/Kmm9tUnct6MuoZmJ7sJ8x/9i5PJWx
	 yVkj0iojidQQHLT3dgEqxxUOlcE9R/OYiybdbOUOKHfVA3vM7EJCnKTMaGkha75ss0dLC
	 w/xLsdQNT1JSpWqJ9yPi4ThsD8v+DXp6VaBrhNGvqI7aHMCcMSl3De2jvfA50MNa96BFw
	 eaQspldbzgW9D71AVFyFjcSfPxSPNbvADr3ylvp5VpdvTwkm5m+SIcBWWtImn5NZmorX4
	 9BMnp3UEzqUYAj9BHtSapaHCXs/snyfS45PP2T3QUt1CbFggqDC+wFjLIOeS9LD7WjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+z41OKa;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D871606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D871606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+z41OKa
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso2541775a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848919; x=1795453719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
        b=r+z41OKa53GIVrOrnWyVqnRw3QU9gJuY2wnkKcCNuN7i4BHr63uyFHl+BSw3lqoxgb
         LsNpvf2sCK4wJkapRXIylMR3g0nAjXBSsoL2YSfYF3/+52mZRLeHV4t0oMzh0ZizOHzl
         AAzslo+x/UHdYn8UIo0BjCJrZzTOks/dT6J7pNc1TuEkMyno5n+UTQLpXbVGZFEUoa4E
         j+JgKSNKYbbl4R2t4wghZsO/tWEiTiaLYZQZ/y92ZU92RKqmtqCAyg4xkxvSkUJ5bnIy
         AzP+OdXPtZJ/aMY8B3AHXdfGH2fQCfM2+A3kUkavGesIHSgE0ycyADpd2ZqM42l3e5eO
         T6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848919; x=1795453719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
        b=NtNnZuDYH/SJVBsu6XLK0Bj5RN+2H57cIzDmbAiwuPrcKOC5KkjnCdBBbW5/3Zw/Ro
         MuyrQAtkKK81Xb2YOuxzbnSprbxpGhXZ17Dg4E5CA8G0g8gNHhZ3HJsR+SHAaoTCRsS8
         zNyEL7gAMwaHzruG5ywSkdczmaxS/J6HtxxqPNJUCq2hu3L+M1ILseGRGZoBFVNGdCq9
         WM65fU/nliofWLIxgU9WBvHssv8TMmzoTdf7kcM9ITDJkdzBPNwSGkdfj/JeSm1+jonU
         WUSuLp142uIoW+KqFEaLK4TAlDPJbeqIhiHU02QNExUOizhDMxNZrBjeWIr6bF2ZnQ+z
         52JQ==
X-Forwarded-Encrypted: i=1; AL+hErHncE+WMTtIsusJu06EIvaMCWEWnW+T21/jrNAoxWLYAMKQPOr3DN2TxqS/eX2MkIB8j2t44IgXKTrhpZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RIXeFw+jvW1t8Tbr3D29wfbKd+tL3GxYQj+V1G9B7mhVgKAMb
	8yUDXEAkB/C43hmcvRn1Zq2pJdPf5pWoBwcGn0moAUvCq2zzDhnOiz9h
X-Gm-Gg: AZFdTZf+2sW2AQpUcVPlhvwQWbOKcvzvfgcBmMeZZL/PEy80hXORlKIeciJg5DNOV1q
	noMiq6zC6ulJ7MF7UOQNgvcesQd4N8jFTxjnGZRp0qBdBMtJJXv1kVa4yzkNHJMAbwPQNgeP20F
	4DaqC9yJJJiL2r5GWMdIIC14rY7I5JwTAxclqhMFL6DuaCuh26scqTEOxGY9XO63DxDhJLnC/ks
	Sw3PE5G200SkY3p5psBeUPN6i5+PPMvn5R4kCqLG0aPIKf3RDWEhcSeeJ4P0792iHlEyBOiUnCF
	vqgAAVbrlrfAO8Y6IegOQd71NI7cVbaFID/ivRThHVm0+XVafh0lpRuJ6ACBsVR6M6xmRhS0VJm
	NodmLvOqZGX5sASdSOvm7ZbrI8SQkQ7MtbeyvrX9OLAQx4qhM3EXN2uXWHK/LCgtuZTBua5ihM/
	wLE8Od8KYHuPF3efAz+IRUdpJG8wXvJbk92wFlKxH3qmco3JEsAw/hOEKMuqSROCH1xW4j48imR
	BK0RTfNdmHEr9Pair7MARrtQr+BmF4WcuAUbSce775tUdL42hcQuRaEOI5gGUHSP+YjMixSvjZp
	0sf2JucuWIwontI2HqAdOPxOsOg7v6c8/B9r3L8Gh/DLQUrKdZKe+K0QeDQ979r1rjjqzNV5RU8
	deVqBSigq7daF9rz/mtQ=
X-Received: by 2002:a17:90a:d2cf:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b1b0b669d6mr10573905a91.10.1794848919484;
        Mon, 16 Nov 2026 09:08:39 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:39 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 2/3] media: atomisp: Remove unused get_sp_code_addr()
Date: Mon, 16 Nov 2026 17:08:12 +0000
Message-ID: <8f23e8ab1daadcff28d8b795c895ad3ca955181f.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_sp_code_addr() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 3 ---
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f..f8be93e03 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -25,9 +25,6 @@ typedef struct {
 	char      *program_name;    /** not used on hardware, only for simulation */
 } ia_css_spctrl_cfg;
 
-/* Get the code addr in DDR of SP */
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
-
 /* ! Load firmware on to specfied SP
 */
 int ia_css_spctrl_load_fw(sp_ID_t sp_id,
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07b..49b986351 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -104,11 +104,6 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
-{
-	return spctrl_cofig_info[sp_id].code_addr;
-}
-
 int ia_css_spctrl_unload_fw(sp_ID_t sp_id)
 {
 	if ((sp_id >= N_SP_ID) || ((sp_id < N_SP_ID) && (!spctrl_loaded[sp_id])))
-- 
2.43.0

