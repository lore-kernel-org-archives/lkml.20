Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681955;
	b=sTyf5aavfYNWkCMM4biXb8JgEZZa06UuonE5YhQfKn9OMeaK4VwOLdOSavdtTd3T9v6L
	 B/895FNtjM3oFlaz+bbV/RY41xVsqh6flpJndDRCKsHKbLgTu0w36+XUEAg3D8AuGQ1+W
	 Wiv6UeO0n+Tvy3dCcc3cPnrepqx01UTvqIX5qVVBKHmCDLAWmT0ZyfU98Ua+BmeGq+One
	 Msxo9mUHgOn2FDxHpcyBKeiED51UMrW0Ouh4oXoS01aDH5ME2/INtz5XqjkhxXxYq/ypQ
	 lTfTwWdwV0Ub4kxglY9gSX5ttkuucOvYBBte4JXwtoRXpHMB1rXECCTV89sv9AKQZ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
	b=npYK5UxD1lOinsgtkIFxnQ0LfhYziF2QIsANlmc5EQKWjFMb+4lUYwA6V6QLIEyUM9s3
	 LonTezhr9YXTRCNMI5SywqYW5SkB00exn6ovYtrrr+lZ1MECIH/w//EqzOXEwb5aoAZD2
	 1IOWXc2Z7kVaq7G8zKMSp7F5ZqP9r/NCeNNDUMIR5SvFm74Sv7A5ih1PUUOdOLE+U8lU0
	 2tiqSGD5sxQ+Oovswp4eDNjZW0B4UOVQgiRnLeUBfNUS0FaDdyXvda48dNpuQYXIk4zjE
	 URwQiuJBKVMRlHZwiQGAJPrmyDXcPz63IZYC6xJP35E5tX+5Fg738iSDfwGTsHhZRmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5326606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5326606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f1e5d7450so295484885a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681954; x=1795286754; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=JUeDpqG++mf++7m4owPYQY97vDM1BdXIWpPWR9xMWUZo/jdQTQsMwApPcqakMIy9T4
         bxBTvAMMz8cKj90Y6hp8UVgQ08iHpVMTDGMkUDTTZhVtpCSlyDuLv23ZnhonAuYDQgX8
         oKPmJkcSN/LwL2vss6NxVKCVeiDgu6Jb9i1asyhayqdGhm3Z2qCoxUSeMlF0vthK2ck5
         xAz0/N+HElRMTaHFWZq2OAQvjEq5u87HjKalMvOkcw0cuyITO7+1Q1tMelM41VswOSma
         eUXZCNlTSp9PzhYqOD42jYE7WEurOcBwmyk9tMnP0YI2OkSYeC7Oqkb+p2tb0NKGtJCS
         ZZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681954; x=1795286754;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=1qytPa4JA9FxDA+W+IMrepPxAvdpdAi1LZXg+PPaPKjrA68loJvsUbZXIjMTJY9zVw
         OcsV8gOr9r4RRE529J8+wHtcNFYuOLbNlC4CnfV7bDKU8bh2mCU4XGa+7sxPVl/8L4W5
         uv8LNm34xtk5CzyypbfVXres91Np0kjQ/mtSkLyF5hyliGAOv8JSBAdVNrOxr2SY3eIt
         v7PzEd0HTZoyE1MuNpb3hAUHsDVVWhgx2FiujuaC230oax7aOf2vPnQno0cxzftlWDmO
         3NVIs9K/vutQDwjkDkH9iPRc8o4qB4Y473drsZfmiesrPX0+GVTpepQFr1UIoQAvdUn2
         tD7A==
X-Forwarded-Encrypted: i=1; AL+hErH/DnUl52clftHVKRQ0JoaR0w0sjCAI12lZVTJ+tAuUNiBSOl+08euZcG4TeJZi33Jo3S1OrNudT0DbbBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oGc6Wc8zNI/OG5QzekY8M/H1bdPUUQwuOIO1m0RlV2WvB+lW7
	UzNEXHkcDSHpSAYtJgEX2D/GdNSr2NjZuAR4U0CLquiQm3ohFtqkY8jF
X-Gm-Gg: AYBFou00MmqBsEyF1o/LSqseWFcKFuxLLafQxxU26zl1jYr4epCuxJDusY0s7Y/+kml
	PR8hTbES7h7evWmy9ZSHQczN/ULIgY3PYPHIjj/BAl9kPRzdk31l9V2Qic2a2SCA+q6aaXOa/U0
	GVvf/PCYd2C88SQIfI+aYlA+kWeKwnUfnWcmQdQVQY1AFX3H4SYwbq9VhOnPdbZIGICKnXEEqy0
	mfR0jnvhNj9Mk4hQCq3wuXJR1d0qy4ZOBEMRZsMJrsiSfuO7gqMKCoAGt7cRjLQ2joGs+0DiPVc
	+CtGmUY7lK3pGjTS8DQYHzT7XQBZIefD7aOIHbtjVdpRNkRShEb65WtURRUfnMM8UK4ww00Qqcl
	d3hSiL9ZBRB3jP4HMxOA6SHesTjjNLY//JI6PAp03gzL8L+9Gz5xgK1R6BCImgnyOTHT1BfEmgh
	YJnb1Cp+rYYJUfW/eIUQmwIaEqH58Rp3txQY0Yl9+Nd31fkpFlbA/KScnG/zBeXzUPJy9fcERtL
	w4l89yHv9pUthmOfIf7jCPsLNZ16B6IL6eI1cEd+3TlwyKi1zHMf+IDjcM/lYDCh4gMuxZiB0W2
	b0vo6GCeLrGVd8QgXHrM5WJNnjPAeHycMMhgryefpJNHquyS9SCbPCAjmph88L+7Kk9uI3PK1PY
	MSC1kFCVn7VnLtXVuIv82Du8Q+BGr9xMNQA==
X-Received: by 2002:a05:620a:25c6:b0:93f:1936:b229 with SMTP id af79cd13be357-9494bbfe4ecmr937435085a.77.1794681953514;
        Sat, 14 Nov 2026 10:45:53 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm338706085a.6.2026.11.14.10.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:45:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:45:49 +0000
Message-Id: <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>

On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
> Follow-up to Sashiko's report [1] and the decision to restrict which
> iterator may perform sockmap updates [2]. Series started short: remove
> about-to-be-stale test, restrict updates, add a negative test. Then it
> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>
> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Changes in v3:
> - Drop RFC prefix
> - Update bpf_iter_reg::feature docs
> - Fix tcp_request_sock BTF build error
> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Alexe=
i)
> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-iter=
-v2-0-e96a63c43b39@rbox.co

Sorry for the delay. Applied.
