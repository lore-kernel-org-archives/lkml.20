Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887042;
	b=p4kQ4EAbXetoF+nWdiN5qRcnssYSHHRyQY1yH4X7qQkjpsxuUCJzhQUo4TeJP3+AEXPe
	 u93ewzCpEYxiWE8miNFIs5vzdRvN5qNCGQ61eVY5VcJcSFUug+7dKhO5QGeHq3zA86UcI
	 EAYO5sD9Xfr9DYSFnBw9umMfxxrUOz4DuN1bxcP7+AlYk/Mt9WAX0iRVCxwd/Bh49Vlsc
	 V/dHnQARjNGpfxrrHpqL2hV5muxpaimzGlWHyu95llOhydgthsA9RWXlYMzfPkNfkhnTN
	 JYXJ8F+4JYk1Ce2Or1h+am60yI+GQgfCQKi4X1UEq8b+VTt+6MAW1G2RHabaiz4WfUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887042;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LugeZGb+Fl7OEGgjSES9UdL88IWgFCStcMs3asT+ykY=;
	b=xs813eypHyq5i6U0KgFTkCDXkr5P+yOt7cXK0CnBnwo/2cvs8CJ40CqxnyXNWetzJeoA
	 vR8jYNkBZIwtfuTzsyR/KAiGgRuNrHMWITHI17ZRFENDP47k1mC4eA0fd5cmlGaBIyFjq
	 9QOcUaUB2wFz40CCUqKjoof5IaglkommC1CTAmG23ETCwwKDgAn/7yo/aQzhBBVWluJK+
	 WjEgHptxcAOByUp5rnA2MpsHfCsmxm81lwQT383z+YzF4/Ivw2PQ7N21GE5vsC8TfyYt5
	 Ahq/g8l6Aoi5NqhwhBIDnQsrzrP7USQZI6t9b6MP1VUDi4EG0+O6DYKKi4sKOQbET+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="R/WL+4qx";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U2Em1hJC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5C606EE91
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D5C606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R/WL+4qx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U2Em1hJC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793887040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LugeZGb+Fl7OEGgjSES9UdL88IWgFCStcMs3asT+ykY=;
	b=R/WL+4qxRVGSNMsUvHj3KhfGQTljIUNgBbzdebtSvv7V8MHqaesQio7Dja1shp94xzElgU
	jJcyO0XvoZqknYBclAZ2ctC8PWKfdkoLoQotO7QddOGgUYehTh11rbzLAURpZHl9P4kxf6
	knaMi4Q90Zvfvdt4Genu9w2KPj+fkkU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-qrkEQhW-PqGAw_6iYuz58w-1; Thu, 05 Nov 2026 08:57:18 -0500
X-MC-Unique: qrkEQhW-PqGAw_6iYuz58w-1
X-Mimecast-MFC-AGG-ID: qrkEQhW-PqGAw_6iYuz58w_1793887038
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1561886f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793887037; x=1794491837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LugeZGb+Fl7OEGgjSES9UdL88IWgFCStcMs3asT+ykY=;
        b=U2Em1hJCFVfRXkgj9mzgfMQoYYzaBAJvSWu17U/Jr8cUWtBJp+eeHEMlD1FpI/JpvB
         kvt4QveGVLJ9kHjXFQ8xpPb0dF1AHrA0CyZP7bTme4ixhVqz1G0qPeOZ1RX6XsypOaKh
         84OGkDCFItDVuyh5kfk0JNtYaFVL8Q/c7lW32EQ+Nd653Men4v/kBsU5LLk3c25DQVhM
         fT4A1rvarEMFqGNEM0x2cf51xsqgizYMVprOknxjcE07YbT2xflEQ5bUK9AkDckLwZ54
         tIOOaUmvnEfeG0bn455r6UoGyU99yuVB32grQvGSZdbelD9/dYlIByqIUBDzSxc+Wv+M
         tdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887037; x=1794491837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LugeZGb+Fl7OEGgjSES9UdL88IWgFCStcMs3asT+ykY=;
        b=Z3OXpSci2RFiTJgHHaRR5jXRLdEumEYR8vDlKJiE3E3+0zqZ9BrrrFCt7/62/f5fBq
         gDfjWpn2UdfA3g5wVaLeJYq7H+Mz1ZrHXQrqQ1g0eukwInGV2K87CYQEQ6hxBrOhpdLC
         /ybtyJIT9bwNT33q+gNGg7Hqv3utsHnVobpH/WkNTDK4mvz976prKotTV3a6C8wRkCfr
         ABDsSKVPRORdpbfF3E+zsIRkx7mODlwdAAZs6W3I8vqdrXN7Q3w3oV7jLP+v0U1kuH0d
         ZsmVYnksA3YsYiMvuVFhas301oWGH+MezmWeIOnhpF1EsxTK53r9f4SpuCeJQjqLDqeR
         iOKA==
X-Forwarded-Encrypted: i=1; AKwUvBzKA5c0OXRb5yhQE06zFVeZBFYUTtw2/aNptbcfY96Vr4DklhwVyEYjbtqZt81htpYfCA2kL6791IJ2uiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z844shpf+UWX2jK1EmyfET/OfaTkZCe196+feg5cpAjRsuT/+v8
	w3YUrXJcgNpInrpgKg03pmmodktwGHGf8QBux0KYkNGw2FmBWVoQnUN9O8QE9AJkdd8h6LlilBL
	x84KbzQd0F+RukRvcpHNLFqXGEv/pFPRYgkE0HJKNXRyvbzK3V62eD3Gnbb4KMQHdGw==
X-Gm-Gg: AYBFou0QPTmUz6zGoiXkc3N/k57d5DQdsaiUMFBwEM0iMdZMYQufm9L32jZEv/HyS7H
	2ujFdO1iFP5blLOn1gAf1vZsX8Z1x+xDsKCd7Xr0D8O1ry076VOgOiB3NqTtRKeusyz9tOaF6ml
	p9nuNf6cBTOU4pBCajAbhYVxe05oXWMmvH2C+q29mCmQtsX8K39V5PBgTnRtklz8T3OFF+gK2Hv
	Vjt/RaDZtp9niyqTrVx1AREgjR5cqI/pe/FpwBPgcU83/A7RKY0Tj32+hoJEDMNJ/kLz6kYPMC3
	ZuHqiwjMerqpFc5BceyEjx+kqUep16d+UMa5f+2+jl87lPRlGMrZHlSTghxd8uVQkWlW1fM+Ynu
	0jZYgkeIIqcgvAVF9hxWJmM8/fsR4emVRWwxGPDOnNm+E3LSH20C86uoivViMUivZc2Zdx0Z/QQ
	X+w2HTIr81+nGZjnVvPdfXmXlyU10GgQCkddqnS5dCa98=
X-Received: by 2002:a05:6000:3c4:b0:491:273c:9649 with SMTP id ffacd0b85a97d-491273c9731mr4515075f8f.15.1793887037385;
        Thu, 05 Nov 2026 05:57:17 -0800 (PST)
X-Received: by 2002:a05:6000:3c4:b0:491:273c:9649 with SMTP id ffacd0b85a97d-491273c9731mr4515030f8f.15.1793887036899;
        Thu, 05 Nov 2026 05:57:16 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm10667066f8f.33.2026.11.05.05.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:57:16 -0800 (PST)
Message-ID: <be1607db-4d7f-4a35-b1aa-0b0c35220407@redhat.com>
Date: Thu, 5 Nov 2026 14:57:14 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] dpaa2-switch: fix port cleanup on probe errors
To: Jaeyeong Lee <lee@jaeyeong.cc>, netdev@vger.kernel.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261102071310.3004332-1-lee@jaeyeong.cc>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102071310.3004332-1-lee@jaeyeong.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 08:13, Jaeyeong Lee wrote:
> dpaa2_switch_probe() reuses i while probing ports, adding NAPI
> instances, registering netdevs, and unwinding failures. Consequently,
> the value reaching the port removal loop does not always represent the
> number of successfully probed ports.
> 
> If IRQ setup fails, i is left equal to DPAA2_SWITCH_RX_NUM_FQS. A
> switch with one interface then causes the unwind path to access
> ports[1] out of bounds, while a switch with more than two interfaces
> leaks all ports after ports[1].
> 
> If register_netdev() fails, the unregister loop consumes i down to -1.
> The following port removal loop is therefore skipped, leaking every
> port netdev and its MAC endpoint reference. The NAPI instances attached
> to port 0 also remain linked while their enclosing ethsw is freed.
> 
> The issue was discovered by a static analysis tool and confirmed by
> manually tracing the probe error paths.
> 
> Track successfully probed and registered ports independently. On
> post-NAPI failures, unregister only successfully registered netdevs,
> delete the NAPI instances, and then remove every successfully probed
> port.
> 
> Fixes: 0b1b71370458 ("staging: dpaa2-switch: handle Rx path on control interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jaeyeong Lee <lee@jaeyeong.cc>
As per Linus guidance issues in error paths in NIC setup/teardown
do not qualifyfor net nor stable. Applying to net-next, with stable stripped.

/P

