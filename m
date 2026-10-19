Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437954;
	b=dxmHzmT2yWQz8iBFwBEnlFWk4ay9L/S3EQh4/mbBWvl7/ZFJdodxX/y9u89tI+ncw//t
	 CNWYlwil5ZWe+I+ogcXhOiA9oft4DrPZ7Vt6tgeYgG1IlRKcDndQ1mJsHGAtMJtVlnkHS
	 S8PYbgHf+vQ5Oc5E8bExDNyl6fdA2bVd3zgOb5/B35BKye8yYx661c4aKm1emi8qWdt+q
	 dsasipOwgfOb90Bg9/3shxSpOY0TPhwo1Sg62IUSEINT6uXdGo2PfHFclYAZvDzOzVvNc
	 YnD9c7MLP3UFUMn82/z1VnRD4FQGnSd6BwbcrzxUEmTWYxeFFl1EKO2pS4FWOIaGf5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=Gl+QuejblNFV3uEkIxOgOsS4jX0GlJs/ROUNx5zrPn4=;
	b=j6dNAnVojH3q/cpWcZSkDSxdbDB45//gxdGFNHHKP3HrR9da+OoYwqx9py9HUqB7mFFh
	 QisW6YYf82FrycLao769vLzTBwKL00IBSr6OXmFzwtVrIO1ZCKVq7Zhq/qytTmuwe2/hc
	 W8/OboQ5lLCLVz77gZc+ZjA1Jlb5bBIZIPC5EwpYBVDftuPYjq9hAVJER9U149H8p9wDW
	 3n8n+r74cbH0Sa030CwWXrPWDpomUc4HqHpqKsrS7y87QBI2NxIK/SFo9sqdysNU7MG9H
	 Gh5OO1mZCyZITczg3PVyMka9Cm4JWetGjuP2PQoPcdye6O7fd5xcZbRXb2+8rQb5/SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gYnQr9al;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5266A606A323
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5266A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gYnQr9al
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso1622495a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792437954; x=1793042754; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gl+QuejblNFV3uEkIxOgOsS4jX0GlJs/ROUNx5zrPn4=;
        b=gYnQr9alcw+J9ojP/SdeDo47GsqS10jIYNdvilfzW9uVyvOFI724RKT1A9EsWtQ3bQ
         OgXWmiBiwDCiu/gWReT46D/Rk9VHkHgUrKHIxf0YStCBAljm0BIHRVvWPUYzKX908eUt
         iCuSA6FUQ3dcvqmycwRt4gjLfOklT6OAGxuKl5xqbY72BqpfGdxLXGUQIuf+OJ5g7fu5
         g/W82eNWWUviKy78jCy3BJRjKeND6NWnWoTU9lAqh7g7bOgPK8d9buk+6bjXfb3EBJwv
         ck0cedd6WPJoOke0xDGXsTBf/906L8PkyCNeMlUttfM6CF3DCo/JPd8cengfq/sPfTmR
         TcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437954; x=1793042754;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gl+QuejblNFV3uEkIxOgOsS4jX0GlJs/ROUNx5zrPn4=;
        b=QVzJinCEbk+OE6zHDUa5+WwlUIxG0nbeP7m64XJ53YOqTr1cfIEgyHU3vKhK0xTzc+
         7vk7P0cLMHUzSELDyHXxIxpFwi5/QxNUpp9jQFR2DMVfNp1mxXN9YveH7tUWr22rGRjw
         O3u+WtHrzxbhHFMWroV/R0W1dy0zk2Fs8Nv0uMoI6493jNXy/08jhguhxeDH19AYSF3j
         sJVy2RhdE3a4ApLJepYR5CHhd5OHGjQW+pLS5ZUGQ4CgHSnbgpz+wXibDZAWlPBeLyVa
         nbdWEQ6wpSD+5zC/e5m1t2yX+Yb5ClClMaLWC8oIMAc2wvYeKc/XkHM36GvkB3Q4hxTQ
         5mwA==
X-Forwarded-Encrypted: i=1; AKwUvBw4VouI31PIdU9+NIIRn0u4HkVWE8NUK+AL8G+crff5a6sIlAIk1pRf2kVVQ0j610JsSr1JwhS3g3ibkrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy/nTxL9fHYTJpIT1YcMd7Xsf5soCxaPCyHA8EF6fI7LtpUGCm
	kOTIZN5mPc5pjjiS0lhEwgaMVPqkMUKtC5/iNjAgP1jPKUhlvcdRkJJ+
X-Gm-Gg: AYBFou1kEMZajSq87EUtGGvcLHMTAsYKEqW2dDzS/pBCjVxXsX+ZFLHcktNUaHW0vnp
	ojbJxbFmh9HoXFIJYuWwyi1so9RNimoXMnepdlecqDIZfYA510eGReuyXJIZpDWGifckMiB1OaK
	xyyYecrJEEDjh1EQ8IU8Xd7GcmtrWLTs1+OfsYxIVBPq3QOK3l5dr9VVBtX5lURNP2sUlFogFRV
	eVwv2+nRZoEnedt9fVUHVxSyE5ExFX6CgV3hpCgbGBdJprdMFMRgeUO+lTEjz4vnjdWhm35O97D
	IP6F0lFRleIoXOyzW2pwDw1cA/4IuSpJIjmllM/PwTukLnyxhzJuwBMugVgvXVowsTRRvk/r4bH
	BYA47dSHdlrRTfKfMI14mfJ3jI+Ymg/EZnPLbTpzUhm20r8gA8G+dO/Op85oxQtpLD7TL63+ZHz
	Nvs5xqms+c4NpTIk0klvbmNs2Z2dCkm9QUMFto0sJZwwoUsAOt0uGR9Bs4pz/Yb5cQk6n4DqFqd
	KdKNGO+qtKN8RoOKEcJUh16PUTGC6p4TYC2gT+DQFIVljx6NB0YkEHmytVvJ4GEuMn4XDnBdP4K
	g6U=
X-Received: by 2002:a17:90b:280e:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3acef58d853mr6802869a91.54.1792437953584;
        Mon, 19 Oct 2026 12:25:53 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05c9255sm8977238a91.2.2026.10.19.12.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:25:52 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 19:25:50 +0000
Message-Id: <DM9282PWYQD9.21LDVIJ8824AL@gmail.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Shuah Khan" <shuah@kernel.org>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Hangbin Liu"
 <liuhangbin@gmail.com>, "Martin Karsten" <mkarsten@uwaterloo.ca>, "Masashi
 Honma" <masashi.honma@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Add syscall common attrs support
 for link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261019153628.15912-2-leon.hwang@linux.dev>
References: <20261019153628.15912-1-leon.hwang@linux.dev> <20261019153628.15912-2-leon.hwang@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 08:36 AM Leon Hwang <leon.hwang@linux.dev> wrote:
> +	ret = bpf_log_attr_report_size(&attr_log, 0);
> +	if (ret)
> +		goto put_prog;

can we drop bpf_log_attr_report_size() ?
Nothing is logged when the attach succeeds, so there is no size to
report, and libbpf zeroes attr_common, so log_true_size reads 0 anyway.
Finalizing only when ret < 0 already keeps -EFAULT away from a live link.
Then no need for the 2nd write, the log.c refactoring and the put_prog
label.

Something like this (compile tested only):

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 849bc91..61d100e 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -5856,8 +5856,11 @@ err_put:
 }

 #define BPF_LINK_CREATE_LAST_FIELD link_create.uprobe_multi.path_fd
-static int link_create(union bpf_attr *attr, bpfptr_t uattr)
+static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_attr *attr_common,
+		       bpfptr_t uattr_common, u32 size_common)
 {
+	struct bpf_verifier_log *log;
+	struct bpf_log_attr attr_log;
 	struct bpf_prog *prog;
 	int ret;

@@ -5867,14 +5870,24 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 	if (attr->link_create.attach_type == BPF_STRUCT_OPS)
 		return bpf_struct_ops_link_create(attr);

+	log = bpf_log_attr_create_vlog(&attr_log, attr_common, uattr_common, size_common);
+	if (IS_ERR(log))
+		return PTR_ERR(log);
+
 	prog = bpf_prog_get(attr->link_create.prog_fd);
-	if (IS_ERR(prog))
-		return PTR_ERR(prog);
+	if (IS_ERR(prog)) {
+		bpf_log(log, "Invalid prog_fd.\n");
+		ret = PTR_ERR(prog);
+		prog = NULL;
+		goto out;
+	}

 	ret = bpf_prog_attach_check_attach_type(prog,
 						attr->link_create.attach_type);
-	if (ret)
+	if (ret) {
+		bpf_log(log, "Invalid attach_type.\n");
 		goto out;
+	}

 	switch (prog->type) {
 	case BPF_PROG_TYPE_CGROUP_SKB:
@@ -5953,12 +5966,19 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 			ret = bpf_uprobe_multi_link_attach(attr, prog);
 		break;
 	default:
+		bpf_log(log, "Invalid prog type.\n");
 		ret = -EINVAL;
 	}

 out:
-	if (ret < 0)
-		bpf_prog_put(prog);
+	if (ret < 0) {
+		int err = bpf_log_attr_finalize(&attr_log, log);
+
+		ret = err ? err : ret;
+		if (prog)
+			bpf_prog_put(prog);
+	}
+	kfree(log);
 	return ret;
 }

@@ -6530,7 +6550,7 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size,
 		err = bpf_map_do_batch(&attr, uattr.user, BPF_MAP_DELETE_BATCH);
 		break;
 	case BPF_LINK_CREATE:
-		err = link_create(&attr, uattr);
+		err = link_create(&attr, uattr, &attr_common, uattr_common, size_common);
 		break;
 	case BPF_LINK_UPDATE:
 		err = link_update(&attr);

pw-bot: cr
