Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681624;
	b=3IjCxS2KYm4NGheCtnrn5P3gf+R/ToLHjibckHROzE55rjCJHWSzVoetybT4ZW5tWDCw
	 lVqJqE+x5YMnE9b4+hegIxrjyM5Ae8CRiN7yerAnE0ri00hWbF6bieElUjUKBTVw1DSf4
	 2pzLx3CZMzb30u/p5bZSJ+iixHVehOdX2c/aJhDqxOT+mJIcSLtMF5Bv/EZswUwn7Iaxo
	 J+0WiL5Oj0WboE8CKVUBoyPtDYh9uOVJbUUsAIdPpZ7UeF/12F9t80nMMq6uJPoIcUnKy
	 AuVuucp/NankmrJyjV0AEkt/ZWMYDl2ImBNMfyW8PPvRu0qMMCqpeZ89NRu+8Hcbm9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
	b=SY/Uv/KA+CtRyxdISJo31yCgOLs2j5mDKmut41vFtPjUSc46ChzClmg4HPZlzDcqTP0X
	 lmAePFAaqxD2smDSwWDvFRLGJHZb86P2VX72VydwYXbX53eVRWFQ2IaLO3q3qIlH8kiSb
	 quZyhyAvQV6qvpTwSl3aINJs6d3MKHT4Lz6ga3s7yHteDszdqYyhDehvEzFjpudUv3j8o
	 BtxTsaaVY6AGGPqk03+IhrbiSxy6UX61+zp8s2AHxLdNrnw1lnbLMki4Jd0hz50AKl98n
	 tXYsBnYQVpM7YvKkbeNdeIiFgM17NO+EK72zFn03CiBSYT0zu8etrKqNEeSilVZKqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E8606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-886e61fa30fso884730b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681623; x=1795286423; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=OKQvH0XBu++VojD/u+INoAqGc3Ax0Cm7sYdvZeGr3L8gqCisEOw5EBV3aKep+umVWn
         an/nnKbxKy6DYbjRYvgu/fZ2SPbcgI9KPEl1Trd1mckq3R53F/E6Eaq3wvQbeeuu9l0M
         0r3nMj/ruEGEiipnr4mvv1s9NXN36nHgwxKsBDsYSprDn+XISlJ2s9UsbYlL1fZ36+YW
         A/Qnm1iUNoYEqgY3KOs/GSb9tQtZyGLrV2AnfoR1Y7B/pv/QjEJyAnpnTilMgTc+fpPP
         l+S5oKVA1wky3qlKOje4o9/IM6XIqLEcmeKmB1OmFo+lhyEmEARsV93Mfdv+LzfBQJk1
         QToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681623; x=1795286423;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=Di1xUiVtNXl0NwaCimRT4ayXZvLWBzms23aObSEdUXTJrJAkA2ITRQcJ/5s/sx0TZV
         4kfX+6ulqwtQGBlXflqHuHMOjf8Eu+U7Seg+kFvHRnFOfQ45KuUZOkLgIR6cg98vmKij
         U33H9b5jsESHmNG4aaHWzjNlz9UDDSeArZ+nNP+6UScw6EZO05iKysyuZzb3RsbJLEJv
         g7pTHs3VNNOnJzdVQLqRp/dd7lATHNJKF+2UqcCwjbZvdC8rvbsxiuPUxwaN6V8Ua1Uj
         g8cqX7A5Y8JDw7ZPXWT4F8ehgKAOaMt8XhNem9nfUchJhUgU6HbJkwhars96FeE4vKsS
         Jumg==
X-Forwarded-Encrypted: i=1; AL+hErHbvIB+XKxstnGMAVY+WP3n7qCzFMCKrxMQFtyUPM7f5HToyCJX4AkV7hR5ft4TUvitPy42NBbwGZzez7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HTleToYvYoMYX+m22jG9xwP1Y/S1R+8LVxEPhYtgyvfINuhu+
	H7kqFdDl0YItac220Oj1fWX+Hv+yBjWwFB/6khfE+PP0cxWKo+o5wV1K
X-Gm-Gg: AYBFou2e13n6a2VXWug/XfCRpM5C/KMAlUVTfiedIRy6288bhm9uwDBjrL5Ij4YNaLF
	zfo0eFQZdnrbwf/I9+Zfrip9fF1P0EChDAPZ1/y7BVEAXxBV/RQvQs2Phn4UeXR64BLTVPosWP8
	PD4nX1nxvqw+sRL4FDhKYr43bd8TIt0Sw0Bea34YW6mQZ0g563gRnCNN/DbKP0nw9umnaPEqpb8
	IUATtc7Kk283dtoerxxNzIiKklVIHpyxcuQteMbg6ATURZNnH2I2n5soVtcl8hb8bhsXI+3XoHC
	1S5dMtG1ZZOHhFzWtuk8EteIJ3mtgbrixNywNqoDleGO05Odywgxq1I3R+Nn6wKaLpP5ntRahV0
	4cTLijj8h+8qRhxf97Y2tdkxJnMZWDivKa3oIYvzWmEfCcwbAlofznxcoqCGP7QESPL+SM+LUvY
	2mgArWKoGx7+9wOl4YoOKGYNm3u5QaXUcxdIRDtezydU50JR9OH6UjoO+nSlMBn+8dyIe45mIwP
	5TPlC0VdlBE7IU5lrQZcsUt9K6WlmF1kDtpbLuUTlvWZDrQuqHSetg8qpCDMubIw9gu+/S3zdy4
	u69RP8k7CU+fi/mCYTgiQMpt8pugLXYQR9Hw0mckktG39lk1D8VxyhDwLCSk16/5l12+CZfJaiQ
	2XIOSksctlxWc17fZ00ID83Fjkt6gbbo9WlQ=
X-Received: by 2002:a05:6a00:2346:b0:89f:ed3b:df97 with SMTP id d2e1a72fcca58-8beb7150117mr5498543b3a.51.1794681622656;
        Sat, 14 Nov 2026 10:40:22 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm2256214b3a.45.2026.11.14.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:40:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:40:20 +0000
Message-Id: <DMV5JEF4P0Z8.3K0HQK7SWX2S@gmail.com>
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <andrew+netdev@lunn.ch>,
 <dsahern@kernel.org>, <idosch@nvidia.com>, <ncardwell@google.com>,
 <kuniyu@google.com>, <richardbgobert@gmail.com>, <willemb@google.com>,
 <ecree.xilinx@gmail.com>, <linux-net-drivers@amd.com>, <saeedm@nvidia.com>,
 <tariqt@nvidia.com>, <mbloch@nvidia.com>, <leon@kernel.org>,
 <linux-rdma@vger.kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <martin.lau@linux.dev>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <corbet@lwn.net>,
 <rdunlap@infradead.org>, <skhan@linuxfoundation.org>, <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the
 header they describe
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Julius Bairaktaris" <julius@bairaktaris.de>, <netdev@vger.kernel.org>
In-Reply-To: <cover.1794139176.git.julius@bairaktaris.de>
References: <cover.1794139176.git.julius@bairaktaris.de>
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

On Sat, Nov 14, 2026 at 10:27 AM Julius Bairaktaris <julius@bairaktaris.de> wrote:
> Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
> replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
> suggested in review of v1. Patch 2 adds a selftest.

Thx. lgtm.
