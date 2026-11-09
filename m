Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242623;
	b=NuqPHONVtZeX8SksXS8gIPrkv+OZyJ5kPOi2vbH9Fipx8DiX16W6SVvkOwNBsUcy0Q6A
	 8Z+NJMg+29EP0Gj+l66gLsZmehmpp2vQcbKuynujT5bxQxUV638dESYPzlj2E7MfSVH3K
	 epClugETHaqApftm93LJzsrXG8p4KKLh/wxZH7GiSMlCu8pWfwnX0i5O4KBlW0huWkmU+
	 KIBdLlJxn09mLrRkUEqM9PM50GkkkWEu/kFUEznLI/J2P6kvV14mH8BIflwYcEFtOpj7C
	 fUgg8ZFycQyoX+2pGZdjJIUeEGssDhif5Mw6Ayo1zrUZkwLGba9pEbYH1aYHCAR3Ezw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=cTcx+iYQEwQqlDWtvuitNRUigxF9/D90op7v+uRHdIo=;
	b=0qbwlV+2OjI/46Kiasm7KB423850xIpnsJDa3lnHNSei7GsyKoUN/MyQdReW6dcbk4z0
	 40VwjtyNFYtb74E66aQwSXRiOUKcl68FP7RuSU+cav8Z2WpkJ9hjEPgKhp4DEuwDvil+A
	 pKCutQPXfg1y5bw+mBSCE4CCX6MC4LFRKc1cDxGoR7a/jhKxTZ+myxwG/AW2wELOI8XrC
	 LRKL+Iaw9uB/WYAEMXs+T+P7IjZusTyprSVIxlC+gcXdyPzvIKOoYKQCT/KYZy6gW1P3h
	 c9ajGdtos1BoQGTmQ2wuMlfTK5iLQA9uOzo+52+RqZAzpGT6AJ94G9IvxL+2IreeWtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/BCf1Cc";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FA606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0FA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/BCf1Cc
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1682536eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242622; x=1794847422; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cTcx+iYQEwQqlDWtvuitNRUigxF9/D90op7v+uRHdIo=;
        b=K/BCf1CcnsbXSn9afua9y6dCw1fhSD50tx15jtTyJSp6Mk6ALw+eZxpNTvhTCPVolO
         4RrA2wNZS3czpBVR6OqVHo0Iyx2vrY/tlhd1/kMAIGH6GEZ0r4NG4CU7sFNUEV6tPyjK
         ADdkObIkw56597yAY2xrIgg2QNQz6i8TKD4jPnGF6rCxhHTRHkgazvdPnyd7WFylvxaT
         gLAiq4bOZguDFEc7i4+5N6hm3VmXkv+BoN1iaWv6PN2swkzOhaOo92J7BoEMGe1zZTrm
         49n7kc6/a5Cp2FSzJxx8kIoPngYm/UydiZadvmY/BHHDNT5kVHgEeTc7Co4b2xG8vPKR
         lctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242622; x=1794847422;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTcx+iYQEwQqlDWtvuitNRUigxF9/D90op7v+uRHdIo=;
        b=VoKGxqIM2anp1PPkjcC4VVBQTB7J4aSlQlXnDR5rE1p1BjlLCj1wL7oVien4+SIUZK
         MDCGlUeutjmhmmoSsKitNgV4ijw05rRFqY8ML34QXZSCbSZqcrJXbVrYp1LfCM9N3mOW
         zbh6CobZ2Zx7sbo260w53SuYRpQD4XnPh21r4pEP+RmWFM61Sk3gDIIdnpQaw0PswqOy
         lWF2uz5nv/ybdhu+ffOYQsygXh21OwTqSCO92px82kcWAl1QAeo5qEI4GwrW7tIR1Bne
         3jZ8H5r6hpTdg8r1bSouCzIVVPCt6iDaywLzfll75wlm/+eWwyf+S3UFac643Ckg6MMt
         RPgw==
X-Forwarded-Encrypted: i=1; AL+hErGYgvV+5JcG0rttKxUUihSd5mMcOy5NucLJUtyGPhD4Jdc5Cls86If12w9NICgSanvkjQ2zJEmV8Ehh7o8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TZB6W7YFsTt19Y7Hn22u5nQQciVnYvAQ2HBmkOF+wtfEkdG5E
	3niErizvgztSupgfazvH1v8XTmReSNNox5PImVYiq9ANxuyHM6ND1zRx
X-Gm-Gg: AYBFou2tIsz4BajEhcPI6RtgI6r/5KuNrYQAJuZ0QZ6I7aXB1XTAcmB/HDzKjqFIR2x
	/9UYhmvfNvb8JLq13pQSMEYOAdMG3QH2AIni8VnGJuEqtFQo+SbAgmtLfpSpWWl47UyrfjR/8Ln
	IuWFXLcPZl0zRNeSfPoQqvbn5QcwzGQVhsCOW9L3ENBNiEUW+gInp3kv+rOrpXGkCUK+d/BVYcm
	e+6K1eg0JB4jV7EdizwGynSmQAEkdFwWsMV8aSkHBfh1dRcarPe78CyfBYE5XG9oLKmWS289NYR
	R+E2/u1fWr1tMUOIW+gpeC138iiQ1JcrsdNjXzLRfrKHILn1RDFFD9hML5J4+smgDTegpoRKUZ5
	/0k+084Q6qagzwxTU5zRmfNfmtm9PICAABCKCt+FGeAhy7pcxtxNVG8FJCpixZcMmFYwfe2Sctl
	yXKeccyTyKWB76aol7+LIzLE/kQMJUXNMvp0+qeayV5XJReuOe8Vaj7AU/IRAVVBriG+/cnD1eD
	ErqYvjPl85TociAL6E6N57mjiDb5O/SifdWYPHvHah3cIgY3Yw/TekR6ocLuaRAHfjQejKneqBE
	qXcrIsRT8f8mp/Q+qIWwwMiBIuCWmaviNTpbDo+IgjKL7m6lO3NDvLUazPZYqvsVRnFCN7Neg0p
	hdS3kqUMAcdxA
X-Received: by 2002:a05:7301:180b:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-37255e4c0fcmr8052837eec.31.1794242622101;
        Mon, 09 Nov 2026 08:43:42 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm12958545eec.23.2026.11.09.08.43.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:43:41 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net-next v2 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CADVnQykAX6Fw8_86emqtTUDWgFzRd_jXTZKdDJLb0s8AUmfUaw@mail.gmail.com>
Date: Tue, 10 Nov 2026 00:43:25 +0800
Cc: davem@davemloft.net,
 pabeni@redhat.com,
 horms@kernel.org,
 kuba@kernel.org,
 kuniyu@google.com,
 shuah@kernel.org,
 edumazet@kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 panweiping3@gmail.com,
 netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <93CEDEF5-5204-42D1-AF92-C63D64546D31@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
 <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
 <CADVnQykAX6Fw8_86emqtTUDWgFzRd_jXTZKdDJLb0s8AUmfUaw@mail.gmail.com>
To: Neal Cardwell <ncardwell@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

> AFAICT if we drop the tcp_timestamps=0 line here (so our SYN offers
> timestamps and the scripted SYN-ACK declines them), the script should
> pass unchanged with patch 1/4, and fail without it (2072-byte rather
> than 2048-byte TSO packets, i.e. 2 x 1036 bytes). So I'd suggest
> dropping that tcp_timestamps=0 line. That way this test also covers
> the active-side part of patch 1/4.

Thanks, Neal. I removed the timestamp override and updated the commit
message.

The revised test passed with patch 1 in all three IP modes on x86_64
KVM. On the same net-next base without patch 1, all three failed on the
first data packet. Packetdrill expected 2048 bytes of TCP payload and
received 2072, as you predicted.

v3 has this change.

Thanks,
Yongjian

