Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626194;
	b=V4It73y1rR2oVBDASf9fSDUoLJlNcz3tD41r5ANVF/mmIq4hryzkgOp7Sc5VdxhWTzzM
	 jw0cmPv1RDfiFSaatbYECV7A/CBNZXK2v9Gu9V5+2m9XdYaGBrE8DMFUoGrpb7zyjsGQs
	 GEPzrU1tOia/UTG5ucqVnkth5VZejOWkLaQBfRl+2KS8PijsoUIIeYbMmznKbZp6OIUy6
	 S6xqPWh7/1pcutFPXu5GXqp8HsQqSSjEjB7OWfoZtm6HfXhclq5wZfV8TVKeE8jDw0vD4
	 Je/DHJYG9undj+pAZbvl1qE7vyCaX/lVaRTtPx8d/69IlaY7XowbO4mnZZdZPM0B02g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o/fES0fk1aivqsdPM4/VqMrWEp/jED2qjiEqrIpnUHs=;
	b=qVo0vaLazlnwJnF1daes8D+VLMseQwonv9xEU2SvRAWpT+bgMLvI62cMGzI04YliYkBD
	 pHG5OBwvlfPkIdZE9JAOwMnweTT12JWTLbn8a+jJn1e0bEBA2WRlmIoNQBCgO7q5oe+K7
	 jCCjA2TqWvAsj02oNQD7LkBHCT0vTCt1MV20V9x0pS4ctF+B2lonUzlQ5gG0Zyy1lgpJf
	 M8jFaMuzZp8zj8CAj7Mb91fVgqXVUCdbwMMSXFbtpHpPzlvcNA0I9xuGWguESDdhpJG9+
	 Yck/0ZDu4HdJnuekVh1De/xDHndojKaivdRwwtn1AiZfUtkDytdPgungzbTLbl4kfXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=GtsO6Cb0;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A3606A8BA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2A3606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=GtsO6Cb0
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-939ed428e11so32488785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626188; x=1795230988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/fES0fk1aivqsdPM4/VqMrWEp/jED2qjiEqrIpnUHs=;
        b=GtsO6Cb0tm+JvMTzF/mD3Njb2oMsfT2vcZLBC8A39MYKG2Pi5QYHrNn11TAJFh9oSn
         qmzJ7qgqFmMMOCosVZI2iQJFI1SEhmPZKuLf3/0Al5EjMjJ+ttu/v3NRlFkpaEN0E2uN
         fkzzlerOW4h3DZx5QXA0aHZ82Gs0EY9tH7XrudR3APBKlRxpXvnq01aTvnrSUXBXjwI8
         xD+auS0ANrAS4tgIBWGqTimFRXACnyU1eVayrO103Hsw+Oess+ji8RikgokpUzsAgAba
         zxz+pXnA9yeh0O2g7zmvk6ffVP0GKnetbrj9he51Vy6fVytAFtuMKty4gqfNHfBEIvJA
         0mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626188; x=1795230988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/fES0fk1aivqsdPM4/VqMrWEp/jED2qjiEqrIpnUHs=;
        b=0z+z4l3ymun8ntmnCRXSyJDx/XGLgl4N+ikGkggpPKaFBfDjFLXy5f4RGjHT/8crMV
         0eWxoLclhYW3Ly6oxIae6GVF35lOGTl+CfDZXa5BLZLMjQnBs6BuMUMM7M6mR+q56JT/
         xWLs9MODBBTnSeW3craJ0tInKtkqiCTi1DxxA/x/YiyuN05OBu+RjUig3/kGYTTm0p9E
         /BX/mO3/54dejDt7Jdurz8Nw14naIzqf4JdmzzJ4izT+o7uRVnEvTcEdS5N6F1C2PhTr
         5rC4ftZUiiJGgStrHO5qkLrrU7citqT/9rE5ZO6EohSk//bRQa3QXCTuV/x4USbNhpnR
         /DkA==
X-Forwarded-Encrypted: i=1; AL+hErFE9fD714gK9ESKkXXKZvs3CKMyo7o/DFkMBeEh2RJUH+c6HEApFVX50trmtBye5xWb/cPqWIlXw0nIFeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nPWIIQt+AZmsub0n1MO7YfQFY6K72PZv/WOCbG3SBfRY5PWGs
	us6/VDz79xOyfauQZavngMwuShQZ+XH3K4695r0Ru8BK1xtDCJF2+eLxzxUtmNtmkN4v9eHY0a4
	GSyw/gNm5UjQn+ZlXGAJvnA3EIQIka+m+B4VME4Xv960M14dXAybA
X-Gm-Gg: AYBFou1DJm27WpGWbib6rRUxfxwPki46d/nSmeGtXDuunY99OgIHPvEDXBuo/27rgMT
	qrDZ/IjpUr/C6A2Lu/XQG1Co589Mm0QXVXjjLrNrHwgn6MPmYFzmmmqiWwEsdI9Ok6QiVN28Xmb
	G8dem6k1kbnYhUE9ug/EJIMOHg0JR260SjApVh16aCanPPhLBfeHtYs0r/6Dg1DEWMb1buN3ic7
	4fjAHe8iZs4OZtDQFOP8eH6ArkRpkfGMbuzPU9NhGTpT4Kr3NpEiCXwcIcNaYe+Fq87bahB+fXM
	uVZfx58E4vR2CfCFLTacYYaBVh7xoQBZgRtKBSThMXXWg/ERguE6CeQRJBJ0cMswZmsT9msOHu5
	Nb/fg5gfJY44aPu6+
X-Received: by 2002:a05:620a:7301:10b0:92e:6485:f640 with SMTP id af79cd13be357-9494bc3ee0bmr678351985a.4.1794626188511;
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7b4f07sm85840085a.12.2026.11.13.19.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.17.2.4])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 3FF53401CE;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 3CDE8E4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/4] io_uring: return io_req_flags_t from io_slot_flags()
Date: Fri, 13 Nov 2026 20:16:18 -0700
Message-ID: <20261114031621.2924144-2-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
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

The flag bits (29 and 30) returned from io_slot_flags() happen to fit in
a 32-bit unsigned int, but not all flag bits would. io_req_flags_t (an
alias for u64) is the canonical flags type. It's already returned by
io_file_get_flags(), so return it from io_slot_flags() for consistency.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/filetable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/filetable.h b/io_uring/filetable.h
index c348233a3411..998026617963 100644
--- a/io_uring/filetable.h
+++ b/io_uring/filetable.h
@@ -35,11 +35,11 @@ static inline void io_file_bitmap_set(struct io_file_table *table, int bit)
 
 #define FFS_NOWAIT		0x1UL
 #define FFS_ISREG		0x2UL
 #define FFS_MASK		~(FFS_NOWAIT|FFS_ISREG)
 
-static inline unsigned int io_slot_flags(struct io_rsrc_node *node)
+static inline io_req_flags_t io_slot_flags(struct io_rsrc_node *node)
 {
 
 	return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
 }
 

base-commit: ddcc50dd41d331dc66e0e5793492c3fa09941ff9
-- 
2.56.1

