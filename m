Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487258;
	b=reXffxiLGSGJretgf1JVAzSGD4iSNmiAR04yWxp3qa/JWXoRokBKHyXpd8or/q+1rupO
	 b1VGuJnXOC0C2k38pT/xtJxt6uuOYhMe3/k+SVzwuqR14cT/4VO8okdQAz01aFnG21meD
	 gIN2ATCaHIwxJtJDmNT1DatNDcDxAmJFSQfFvxYVbMAAMCwAQh4z/7OVSiDUfyaDxNL8+
	 x6mh5SggCt0PnmhwY9MMfEhc5g928oY/zcVx6xgglcC1AzQTe3a/cOS9Tvq117WSRY/bv
	 wbCoZ6dA79+lT7X3tMgrCj6bKEdFEZqZu/zunl4e6yH6xuay9szhW7zitMMsEcO8B8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Z8fT26vpsEDMPRnKW6QzA2H7dh87iXVUMOUV6O8C+50=;
	b=LN3OGz3sTug/1yhYU4pN5qR/PE9RzjeOQv9VEgxDsyF9BUGh7EODSdUaGq2zGnjxtWQY
	 Vm2eW9pZPGpOzHbnBl0iZxuOuuaUGKuTS2Jm+4PCtKHrk1Uecekg0bSVjDmvRdMkkAJlI
	 3+I+gIhKhSw9tMGX6mdDKN+sM2Afsf/xSEJwDjJE9MFZSKSDdmVg6Gql29YreDQ5RELWH
	 KGb80fWsvkDU27dUnHueSZdKq0RIX5G6ThkYPd1q+qiralC+XWuTKDaIeDCvB8g94p+lm
	 bTYlWuKNUPgtENUsrQzJPowVmKYjRWijPygKpQmBi2Ff66dtZ5XcMPhHetDH3mSj3OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9JH1JKp;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F875606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F875606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9JH1JKp
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso982981a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793487257; x=1794092057; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8fT26vpsEDMPRnKW6QzA2H7dh87iXVUMOUV6O8C+50=;
        b=l9JH1JKpuOVnqRGAGQhCpCfSchc2IxTEi3pMPwwzzMEqR3/PIvkYpeO27x6B0Vpogr
         yV/4ngakbHpr64ceYOk0SfcPZ0jTojMWQ1QHPcKHJQ3lWT7Me7+HybFR69JETMEHl0OV
         2gGq8Rk18Kl3omz8dSXyGXA5vlpgS7GwY7SGdQk0lLgWB5pgG9tbuoD2izDXylRyTtlM
         ZovSOIARxZ2LaYy0AOszBYrQZxMEsGwelFfyhvLyE7CtU8tK1vE8n7vuYs0DG3m+tHeq
         HIVv5HxW/+rytqtBeaI9LTmCcxeTHMcuGglWT4iPos07jMLZSFtBpa07u4j3zlayTPqv
         ME+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793487257; x=1794092057;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8fT26vpsEDMPRnKW6QzA2H7dh87iXVUMOUV6O8C+50=;
        b=GypafQw/RbXZ3Nou28bT1HyOvZpt9WmSq5Mly9E/4KZEwviBRErX5IDRTxJ1lcLzff
         p2ALkmLNVjVSAKpdUhTGdzy+yYxpo2kYVq3Bj5djlD+UdOXLRiM8aR2jJSr9dSGE29zH
         TRtHVBxDLfA/JEk4lLwuHGJJB7RC9VBrQ81ZdaP4TlqYjeH90ShMjw2LFvVTN4d07XXD
         PK6Y0kOQVryxLCfwBVi7C334D0U6AQl5JxVTtj8Jc5JhEBsYJZ9a3p6ZyXsaz+tjdQ3x
         3ukh4vK8K8YyamNPuyH6kSQoHEaPlzoCl/RV5W4qsSI1pAtzDC7e/4vAEocSbrwFSbmK
         XQHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC+zsuBCYmf73JNr4nyfvy/yLauI/hrGy7OJgjgUXhNHTL+BX96MVcDE0XsJMtjNNU7ivYahAkdVagJpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcgdXeN7ACaUcU+5jyOIa6fo/kv7qfjaeKOQGFfxtAYTGPrHW5
	dZbODU0h5D+Rvf/XOFHkqvNoTk92f/m5bvome6uezKDGaWBQAIglGR9S
X-Gm-Gg: AYBFou3fguPAO8ePNxPhr7h/BJelrtGX8psMu78zd0JU203e/8GfPvuJDAfo2x7ZQtD
	mZdvry/jeo2H7rqC42Dz3BlbgE2UnowrtDj97n4cbf+jsiEjewIw/nEQA+FsRj+48hzUhTEdWOS
	+tOYt9KU4Zb9Zz+a0lgKwQzL9mEw5YGkaM5k+0xluFfuphUVfDylLTlp4vFe5XAgkAM4B6XbAD7
	YhNgFv21ubMwIXt00Nln9Wra+Pn/6JKyBNT/PBL1p332RfpbCKcFpPz5Vj+RfbH0uzJry256U1h
	LiLN8my5HVQ8DUHOdsYlvxFOsMDMD/+I9f1IkJISQ7fr9Ho1DsHshiscWhT5lQMrKzhay93l04O
	dboktq8APg+oMsa5rzohip2uOW9GcYtwX8ViMpY5WL/E6uLr9OSo62aN60D3erCGLlnV0kg/NYH
	Ig8wXutNIv2GgeNbVrbgYoLT66C5Pr9Nz3xB+v49fTZ0uQqcQvHp/ORdHwWRUDuYWZntnDxgS4m
	1KvEn3tDxA8tQDAzHgGO6FBHICHRMMEmlf0o5K3XIVoswHkEvUaujRi3+i5xyl464U+0pfmmzF6
	AVhi+9Xq1pjhafx6qKKq2KovOf8iZ+pX6OLsfVId0M/THSyBkoskGHnQqu5cbCPtEiiF7Sjg9EV
	S9fy+stqe3zjrFPRQPoez1RRZPhYV/mBN1cgZA3izyeTdop7O43k8Vuc=
X-Received: by 2002:a17:90a:d2ce:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3ae897f36c6mr5382448a91.31.1793487257312;
        Sat, 31 Oct 2026 15:54:17 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm4636221a91.3.2026.10.31.15.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 15:54:16 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 22:54:16 +0000
Message-Id: <DMJE6776F9F0.1O5A9ZMKWYEUP@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: port test_ftrace.sh into
 test_progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com>
References: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com>
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

On Fri, Oct 30, 2026 at 11:50 AM Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com> wrote:
> - commit 1 brings a few new helpers to manipulate ftrace from test_progs
> - commit 2 performs the actual porting
[...]
>  5 files changed, 412 insertions(+), 46 deletions(-)

This is quite heavy for a port of a 44 line script.

Lets use a tracing instance. function_graph works in instances.
An instance has its own set_ftrace_filter, current_tracer and ring
buffer. rmdir undoes all of it.

What goes away:

  series                          tracing instance
  ------------------------------  ------------------------------
  global tracefs files            files of the instance
  save and restore, patch 1       rmdir
  serial_                         not needed
  all functions are patched       only the filtered functions
  new progs                       progs/modify_return.c as is

modify_return has fentry, fmod_ret and fexit on the same function
and checks the return values.

The removal of test_ftrace.sh stays.

Instead of patches 1 and 2:

diff --git a/tools/testing/selftests/bpf/prog_tests/modify_return.c b/tools/testing/selftests/bpf/prog_tests/modify_return.c
--- a/tools/testing/selftests/bpf/prog_tests/modify_return.c
+++ b/tools/testing/selftests/bpf/prog_tests/modify_return.c
@@ -61,3 +61,28 @@ void test_modify_return(void)
 		 0 /* want_side_effect */,
 		 -EINVAL * 2 /* want_ret */);
 }
+
+/*
+ * The same test while function_graph traces the same functions.
+ * A tracing instance has its own filter, tracer and ring buffer.
+ * rmdir() undoes all of it.
+ */
+void test_modify_return_fgraph(void)
+{
+	char dir[128];
+
+	snprintf(dir, sizeof(dir), "%s/instances/bpf-XXXXXX",
+		 access("/sys/kernel/tracing/trace", F_OK) ?
+		 "/sys/kernel/debug/tracing" : "/sys/kernel/tracing");
+	if (!ASSERT_OK_PTR(mkdtemp(dir), "mkdtemp"))
+		return;
+
+	SYS(out, "echo 'bpf_modify_return_test*' > %s/set_ftrace_filter", dir);
+	SYS(out, "echo function_graph > %s/current_tracer", dir);
+
+	test_modify_return();
+
+	SYS(out, "grep -q bpf_modify_return_test2 %s/trace", dir);
+out:
+	ASSERT_OK(rmdir(dir), "rmdir");
+}

pw-bot: cr
