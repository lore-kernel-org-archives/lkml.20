Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858632;
	b=xiVuVgNaj3Jxy9VUpJB1VN7tmnaOSuAD/xIe5u9guY03bSLEh7xzkwYSap37doOyIOVf
	 ZFhEWU5L3ZKjwYGHgTcuZbvYCuW3ofZwaO5PgEXyNL5dnLABm2aYl8UeUyBIvcycLTQzV
	 6jHGWK22faGZYkv9PkwKYSi/CL1nwveyhwbMu6Z7kW61RWry3kzvVvFQmqkzQakKeaeV/
	 9SEvegMsTiSuHImjh+0MIE0gAWJHr/4ZwIUpM3C9aXM8D6PqrXJHFy6Cz7qIrTg/zxCtt
	 bWzmyAuLAaB/sJDxXOs5bNaLDGO048gYT6YCr3d2DX8mXelgFO+NQKl8Qbc8SvYBG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eFdg050KOzhqiZr8wAb8DDApASy+byey6lJxXjWxoKM=;
	b=ZFHcDPRZqBI8UfvN46HbRwiRuX0coTLcEhG9uj2Aw9hV5pFfKAudxAzuDZUq7pRvWVuw
	 Qg/yqxzoXoyjSkQ073Uwv07Zhx+i+0KUi3Y0ql652vvVbDG9WCramrrBnFcadJyzEBwlD
	 +mMrJHnec5HxuxGQPUodf0i7zesNIE2D/JUd3ZM/JQVxEVmtCv4n8xrj1/h2w+b7cUSjy
	 lp4wdugm6nWdFQMnFcnfkhYEUb5mc6Wb9ANdTae23rruR1bq84vc5ngk/CpYmwYplc2AB
	 14o2cAouigFOD0FrTp91nWHUZBM0vNHZCFLxdyWVK+Gnl2wuXJNBLR/EqpXn8T/OgXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVPMv5Jj;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D81606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVPMv5Jj
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso3304843e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858631; x=1795463431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFdg050KOzhqiZr8wAb8DDApASy+byey6lJxXjWxoKM=;
        b=fVPMv5Jjqv7rtUacwUWwxgzGUKh0kbGrQvPDNKQgdg3PfGugNot89oLZEB9uDECq20
         kt4Ze77lLAUWZGkp14AN3KdOXlAaFBy6L1ueciTnmSBmoUb4pfdFZ98zR+pQ9zsJLHRz
         5nDBMJrkRJwuttQU+Ggvi+BNlUX+jFGCDohXhNdYfz9d/+lXqn41DpMVBBRMcPxA2dno
         u6/HTzFgpjeTl4aZ6r6xtb4uuwBS8N/HMAuLQlBTlSa72iUI06FvQ+5ohd4heLO/y1MN
         fbABCiqCeEaaoSb85YjVoN+hfHep4gg/mFfBJr21Bw4mkQbFo0cZxdcylKM74107fVf6
         7G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858631; x=1795463431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFdg050KOzhqiZr8wAb8DDApASy+byey6lJxXjWxoKM=;
        b=QdTbQqU6XK1JEPGTjOwt55Kg5BpLuWEjDF31wsGGfLl5sTD0Ylu47HqlIN36U/r4tv
         coW0PNsemir9gh0zaJtg/3k+YCaOLONb9Q/knp6BzWmP+zJq0jO9kW64Ns0EV/PCeEvv
         yjzcPlv4DysV1Py4ON1ZQivva5jHvt8EiDdPCfM0q1xfcz/3Hx5+UUmJBUe7d0JeAn6s
         0ff2D2dpi9ImbvxNZM+KnbZCqKsVoPhEDNbOnz9TlpXjDm2h6222kAK+akIm7C9XJeUe
         rhkiVKkkIRFBkxiM2JEZzBakRZ28UwCWy6fwFHYOGrGCZQI67VFxiuG1zCEDPdHQvA7x
         UnSw==
X-Forwarded-Encrypted: i=1; AL+hErH85ICW6YC8ErF2vmaODRIUPWEWmiqYE55cyCdMZFSnfSAUWvHqDtykkjGG3DYmlcJbegJjIoO8rVbpz1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YNQaE+GKQ8dzhHZONPzroQ5/rNG1nvU9bkF908y0I3K4WP3s+
	Wyg+AHWchTGfTfUo4mJLixbyAwVZOfXGPDQ9cWoqStfpZn4d1d6EucnH
X-Gm-Gg: AYBFou2LNu2XVjKQIFUblxfWPO46vtLT+bHh7aqEIs8hoyQTznbnpKpN+pNe1lxMBlX
	SaqBB3L7DDjKhf6M53uWB1thXwCIG7oUvJQ8NRvJoTeXjwJ0QYF1x1Kelv0KOUO3rOOaznzVFLt
	eVbiHP73HK3KG89Axfm556M/Zem7PI0qejV2eSPIDc2wM0U44W8FFhhWaVhX8tEczxeJWNAcgMQ
	3+mY/g2w0BL3WkkgEDh2N58H39eHNk0CcyvBPCJ/m9eIYqBggtsT/JtL07c14zrlurI23QKP6Hq
	2w4qECtSip5yZ+UaI7kBwB+1N5dbCNgFnDj/ms95/f+NwGUi1+G2T5KR/8yG8QBr5+HFBqT2uWI
	MJ/y4BhzOOhoA6xsDgE0K3cHYcSvq6j2fXMS2NIg8hlm+oCEmlRMEFUISIZ+7ieNAYOZXRKDtea
	dBl7KnO0Ku5KQIjkn8twosp1t7XvJKHA72Zi0rfqvzfI/+izqswGoGxTcAddxs+s8imsH0i+8Ll
	KCM0iTSsLfwEaCpi8WzI9fxht4PjZAxEi21C4niUPUpZpZx6mGue4kOqri4uQbqYgVtHhUfNHRr
	Q3UL7QNaod5C3cjrVY1i621Y/8JKeX1rpA4w1c8=
X-Received: by 2002:ac2:568a:0:b0:5bf:cf80:aa76 with SMTP id 2adb3069b0e04-5c170435903mr4496087e87.0.1794858630530;
        Mon, 16 Nov 2026 11:50:30 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d1ff0sm35700701fa.32.2026.11.16.11.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:50:30 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: sync: atomic: Fix typo in SAFETY comment for `isize`
Date: Mon, 16 Nov 2026 21:50:09 +0200
Message-ID: <20261116195011.24156-2-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
References: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
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

The SAFETY comment for the `AtomicAdd<isize>` impl of `isize` says
the result is a valid `usize`. Fix it to say `isize`.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3d63f40791fa..61394a32951a 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -106,7 +106,7 @@ unsafe impl super::AtomicType for isize {
     type Repr = isize_atomic_repr;
 }
 
-// SAFETY: The wrapping add result of two `isize_atomic_repr`s is a valid `usize`.
+// SAFETY: The wrapping add result of two `isize_atomic_repr`s is a valid `isize`.
 unsafe impl super::AtomicAdd<isize> for isize {
     fn rhs_into_delta(rhs: isize) -> isize_atomic_repr {
         rhs as isize_atomic_repr
-- 
2.56.1

