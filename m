Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466609;
	b=ftHeqBllwLvaE4zSxSSGfojeM7VmKAwsf5dzodXoj/W887Mw6jOYboMVkf8ls2slc3cY
	 YmKVwKIiFvyzFnnad4iBjYAzWHz4Z3gDJkdDwGV2kDk5IHaATg4Kfp1h6Wg677Lz8zQMZ
	 qWWOFZ3okLBev2CBHJWu548Dfss6quwpY3XkLzR32Quq1I9whkATxZJCrQP5N2dlxd6Ry
	 8Td6XeAXYSyEf3co0HlRSYrljFtQ6dXNHfuuOocFmPHYi1mBmVnz/wRaFj5EkQ7AYZEw7
	 S/1iBnC6AG2LdRZj3ldbAqrFLgD3WEMqF+u4MGL3+94sdd3lDKL3NKp48l9QL4UaYLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
	b=SzD09tSezlAs37qvK8EJaiavAZ2FUkBY2y/FnCPQFn1e3IAFSTejoNmd6p2QZILM4AHN
	 QwQBAdASlpJ1ysom7eFpAAH3uiYT1SeGU6zIQS58P3viDxIvuVr1t3EnkSYgCHHHuK4Vc
	 pIpciTj5mbJBjIbg+HjbOkAoG9JNjHDydwq6ZtU4AiT809N2czNZyUcXMF1gPd3jGKu6T
	 POTlxKXJ9T/GucKXGGAkoYOwc2iVjlf40FbU08b155M51ejYlB2vb7Vk5ndHypsuKh9ay
	 zM5E/hfNiLaqi48blwwvqv22VDnAojUdYkF///PVsKEsRZr2P3Vr0OQIxA9vG1DnSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAlQpn7V;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A61606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A61606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAlQpn7V
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1086475a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466609; x=1794071409; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
        b=zAlQpn7V5Yxzz3a/EooOjbQS76Q6xQ0YpJEIcGp4YzdScOrPhhAvrUur4/FQHYJqRA
         8zfHghpz6jXKETFWCpI+22lxZ4tiU8Y1Wc2I1LGCzNcA48QIfHM0NthCxotitdxVloRD
         7jW5L//FxVzW4EuToHyaxOBM6p67ZQEXBbXMiVGM13bEtgPc/LRBcWVgFZo7OtjjXbae
         x38X4P6bQH9CmqpDSl/U0Gq7hPzrHgec0DsPUl+NFmdA/2pRimxjub456nrjYLulRtoc
         kY3kMmeFOtp3fe5XwkcAgy2f09rE2oqb/7WSkbZ5wd7smSeRqi0JaRIl0JBf3GPVA6ml
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466609; x=1794071409;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
        b=07lsAtUvuq3hsLc42P0GRAaULDMxr/mSk/8iaj2fwGsOlRlS6yJsrm2lfszFTjx/2P
         Vbxluez2DXbcDSVcLuIY4JewhmZPhm0nakoEcEVZu6vmbsOtTWs0chxmEtbUuqPRaZnx
         OnA2zVRVy1/QcJPsKT4gXcmIcACaNS5kH1pR5H+Hg0WRgEiGoasNYdMqjAuKVcUDvel5
         aPOx0IF6fG55r5y8DDYbSlrZCQpWEfP3T749TkTSl4e9lwvnwigb8AGbZ0fL/RA1+Mk8
         YIl6LmwW3V8KjTM30HS0eWNwttyEbQYUn19Qks7wcNvaLZoyjuTpdGqq07ClxY6ABnmy
         KFGw==
X-Forwarded-Encrypted: i=1; AKwUvByOsbWT+UppeujZgPMQQ4uAn2tLu2WdF8NALPy5G6ylReBVTqAh+YaY1YpVTtuQncivAz3KN+aNV1rewtg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyLM79aC81fmkBJslKJvPXkeHy7eEDQGLqS7HhsW9vTfkKtll2
	Ac3MpbYdp4pG48o8xhNf1PYSwuNFe2bJYvTOkjI0vpwribLHTBf+p+hjSqhNUQ==
X-Gm-Gg: AYBFou05oDJYulVo5ir0Vu4/GdQGBQ5SxFzz9SSj30LV1AKSuMDpk82jFcoM1xZ/9lL
	cfivkQ5GA3I8vxf+DutJ+PwDJ/Eb43/2RfWn4ew8gCPIx/cd1O339+1OxTiKHHDb/4e4aZfC/3D
	ErfZh/WFlDsKYhV1EvlkDqA9qkCxKBxbKMhxXAIdzpQvgmnnT59FELE70qYe3LXPUXGd9znKzw5
	TZVgGkE7LyhfrJc70JnQD8H3IoahdHRUAbu5Nz1XFYVdNH8i87NSnQS252BDsUtJ1vgxKn5OC4l
	dhvDbBvE2dRP9A5EdVn2GhEjlMMYL1Kh4HxjWKMUFkn2scJcKuCDeCL432/rAXxcL53KgCk4q+w
	4EM12ju6qbiGAMSAAsXSo65rw3a6V8811SP/Tki/pGUW1exeph5WOury5ePbCGrmm/1Vy5Q97tK
	fZvsZd4yxlFVMe0t0NxNzIkor/tjpcTcwuuI9sGi7pWv+2+GLBNFgKcMhUcp24NjNpHFiaM7rrQ
	ZHB1fochI1CLLHMnpbk9uaQ50Xywb/csiP2zerPlJjQR5OKXQJ2OppsnpyzywPLcPx5jEcQ3VK8
	yI673PbRPJEP70jZUq394IizvxF4Wyh0hzSfjSDP+ojvDCocCTAkqUpW2FNKsm5xvpbeXwz7jJb
	zy37anfbSIWpEjiUtrb2osI1pxoMW8LI+2g==
X-Received: by 2002:a17:90b:1a8b:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3ae8970fd9dmr5106038a91.13.1793466608564;
        Sat, 31 Oct 2026 10:10:08 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm8093713a91.14.2026.10.31.10.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:10:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:10:07 +0000
Message-Id: <DMJ6UP7FV1X1.2E7I2ILPBS34P@gmail.com>
Cc: <ihor.solodrai@linux.dev>, <almagui@kernel.org>, <martin.lau@linux.dev>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, <nathan@kernel.org>,
 <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>, <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <abuehaze@amazon.com>, <doebel@amazon.de>, <mpohlack@amazon.de>,
 <jay.wang.upstream@gmail.com>, <martin.lau@kernel.org>, <mason@kernel.org>
Subject: Re: [PATCH bpf-next 11/13] bpf: keep module BTF until the vmlinux
 BTF is parsed
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <bot+bpf-ci@kernel.org>, <wanjay@amazon.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
In-Reply-To: <df56aa51cd704ab9a9b03d3574e6ab4c61d5e6d4cdddc17f4b0253f67cc077da@mail.kernel.org>
References: <20261031130959.23472-12-wanjay@amazon.com> <df56aa51cd704ab9a9b03d3574e6ab4c61d5e6d4cdddc17f4b0253f67cc077da@mail.kernel.org>
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

On Sat, Oct 31, 2026 at 06:55 AM bot+bpf-ci@kernel.org <bot+bpf-ci@kernel.org> wrote:
>> +/* Undo btf_parse_kept_modules() of a round that is not published */
>> +static void btf_unparse_kept_modules(void)
>> +{
> [ ... ]
>> +		btf_mod->btf->data = NULL;	/* the kept copy */
>> +		btf_put(btf_mod->btf);
>> +		btf_mod->btf = NULL;
>> +	}
>> +}
[...]
> Can a module BTF that is rolled back by btf_unparse_kept_modules() still be
> reachable through btf_idr?

Yes. It's real. The NULL deref in the inline BTF is real too.

This is quite heavy. As you can see both bots poked plenty of holes.
Five of them are in the -ENOMEM rollback of patches 10 and 11:

  where                        what goes wrong
  ---------------------------  -------------------------------------------
  btf_get_fd_by_id()           takes a ref on a BTF that is rolled back
  btf_free_rcu()               reads btf_mod->data that rmmod freed
  btf_parse_kept_modules()     -ENOMEM in the inline BTF removes its file
  bpf_struct_ops_desc_init()   -ENOMEM of ->init() becomes -EINVAL
  btf_vmlinux_data()           -ENOMEM without btf_zst repeats forever

The rollback exists because vmalloc() gives up when the task is killed.

can we run the parse from a work item, schedule_work() + flush_work() ?
A kworker gets no signals, so -ENOMEM can be final, like without the
option. Every parse then ends in smp_store_release(&btf_vmlinux), and
btf_get_fd_by_id() sleeps on btf_vmlinux_lock until that.
Then no need for the retry, btf_unparse_kept_modules(), the 2nd call
of ->init(), etc.

See my other reply.

pw-bot: cr
