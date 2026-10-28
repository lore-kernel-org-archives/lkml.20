Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155121;
	b=Pa82c0eqGzhYzB7Uj6LbvCxY/A8EeGjbn9WnD3cUTqUCgdOKD2TDDVGSZF2A4bM5tjqy
	 fYKb2fjoQYZvwe3F6gi8ynhhmZNgT3xH10C/LrJUL557bj0QuVNqNHWP3mgUmgG2KBRKy
	 gEzUGFGSXEDDd3R4RGRLyoXXJZIE+72X2KG2/fGi6quWhBRYTlDhpwEBMlfjK+GNApfvh
	 /EpVasMkkgyv6/+4q555r6GVYPEuze39gAhlbdFzIefRqyWmbetja56xkx6HjkyHtrFDq
	 d/wk+uuTDhE04nkbmbET8yCnuPWUdLbdFQ/I4/l7XCsPDN/lXxc+JeCB3Pn0CN6AUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sz4u3HpKUz23LFhmma/JLWrak4UGChsbULg05R22p2A=;
	b=n5EKcRuttCjsId9fwNEDyt11DmUj+NRbnATfqyAZxEMJWgirfFmK4G2K1t0E3stvdCeI
	 tQikwrUIH16Rml+G2ssro9vRFAlx70Xu4uII/f9GQSPA74SWp8SmfUYT68UAE0fdqS4QB
	 4pp9plgQ3YlUftraIOg5byEdt1kvPwXlr+tF76YHyvrZ8lOhj8S9+n6MYdOqnGPO+rYLC
	 4RF8IB56tmve04YOpVb2goyU36KUSocgew3RRiGPH1CXBmJZKrnRXOnTPp6Ot+6n/nyFq
	 gsalpRHsLqg6mqjd1VeMFwIN7qgcEFMy/A541DUzzLubh/VAfUYHZJnQQuv/JFL7yQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQE83O7l;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF280606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF280606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQE83O7l
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eae1276409so222604e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155120; x=1793759920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sz4u3HpKUz23LFhmma/JLWrak4UGChsbULg05R22p2A=;
        b=mQE83O7lN8QiKB4YFOlMv4fGZKFIXikVyTQ1nRMcjsRrDZj0iZPt2NIjzaiBVW3f9i
         MM6wCtffv91D9M+fjhK4rUrcdn2u7DlYtW2oHEyzXSsgwMvJvEjnXv3o2uSfS3J7wAWi
         VvtpTzHDP+Fq6fMs8CB8lHmr7SPlB8ayjN+Pyyi5To5Fh8egEez/YGgWyjUxzpDBF6m1
         MPvvc7M8XSb9JodH36OFNHuM2TtPUp+Zw2Jw8BbS5rJxg62ASGRBXf+G4PzwtC8CBteJ
         gCEmHByKpWiiBHo3ftcelFcoVY0kC6T9x89IsrulJi/yu1drIA9u2cdG/OUOtZuO43YD
         8msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155120; x=1793759920;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sz4u3HpKUz23LFhmma/JLWrak4UGChsbULg05R22p2A=;
        b=kGvdjkav7HBxQXnL0+KKrIvadZZl97IM7Rv8AqG+kfCrRQbDGVXvWNHg4mA3JYBIVK
         eCgkVMnxy52gto0V945GGh9L4aGNAaqT9jEqqHE33gVqIpyUdNo/aur/RtyHJweDgOLX
         Ul8tBS3Klzm1Ks8FOof/JZsPvkgckziw0Jwl4dvsLgDIuLRReEpKVS0HFmRj2MWWBRb4
         E5xVikdUYr2iPZysEh8r7py4d6IqiAB0VMiN6uwRni+Rk1HoVB5LZ0UN9Fpir/cn83vy
         W/UPc20rCknewNyWn10u+uCidSvWkpaOUJVrOktGwh3e3ea1TcXTGxaSLFV7o1myfvyD
         OUrA==
X-Forwarded-Encrypted: i=1; AKwUvByoNzvnXd+nBe7KR3JT1lESSg5Cjz2rCYelqVrLY1/pfp8THYQNqjJxJbEbj67FIgzqnFy/GKwuWUH3gsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP9yB5bYwjbJVmKAB5uG83JbAsI8Hi90GnZJXV9hZSKKKyjc2N
	abYprV1iPMrd6K2FSqGDJPM9sN8Bwe1Zb4eWPZS6SJCi4bQHK1XWJk30
X-Gm-Gg: AYBFou0/R/jH3k21KoCnP22GMUMAhnTnztuTTABBk9bGk5JxQ5PBg1IEtC2bZbzr7UJ
	Qoad3DVxrx/ZRg/Fs4qq5HZbDxvgeMk6UgzUU2eX32KP4gQcN69U3jR//sNGKI87aR4wgYZAwR9
	qJpUF9aqIUkiPFNkf8thhEeDlBCO94yZA5p4RexVHWhlyunY+Dqe0qShnxrPAyKHV7xdPmfriiS
	wK+fgNy7CJZ460M4Yg/BCV//XaRvjqtCLpIRld9Dh3m94lqIFLJrKPGqkJkxddhAKUO1mMJk8jF
	xYE5Jm9e7z6NZNAXQ1+LkZ3K393B6+qTwryyCXM7H1V03JvJL3HQanwL51CfY2w6YnQcYJr5bAR
	aDPaGcOqAIn8Mvh2pqJ7S10O4ll2zJvmDR38c6YYf2zx2xVrF9UyYiEaY1E5OzKjVBb1yzkmuBX
	NP35aiHtQXBIlzyKGgaApzQUW+8wZKwcFs/+7XVLYADdtmCb6g1KWftxRFRczGUbkfQyjMEAQRR
	D4WP4LKfWgDAtv8RRC6mwQynQeoOr2R10xk+MDFJUpkCq9BHCZYBDjek+/Fdp7y/RCGJISitiUT
	6jjKGv/GKNG0fltjhDtH8PXZLCDBGZ2rJt6zlJknvVUBXF3cwP2EiDu6e2iEg3nJVDBdPLNuymp
	WemhWioAyx44HRKwfghnetegrv3pSeTcHZAm1ztuXA+merebx8zNJplVC43Ih0SOMeV4Q
X-Received: by 2002:a05:6102:1499:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d03a289d03mr511256137.4.1793155119764;
        Tue, 27 Oct 2026 19:38:39 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259eb01asm4585892241.8.2026.10.27.19.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:38:38 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:38:38 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jamie Nguyen <jamien@nvidia.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 netdev@vger.kernel.org
Cc: kerneljasonxing@gmail.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.21cdd31ffbfbd@gmail.com>
In-Reply-To: <20261027162945.2122306-1-jamien@nvidia.com>
References: <20261027162945.2122306-1-jamien@nvidia.com>
Subject: Re: [PATCH net] selftests: net: txtimestamp: fix out-of-bounds read
 in raw UDP checksum
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jamie Nguyen wrote:
> With -r (SOCK_RAW, IPPROTO_UDP) the test writes only the UDP header and
> payload, and the kernel adds the IP header. get_udp_csum() still expects
> the IP source and destination addresses to directly precede the UDP
> header, and reads 2 * alen bytes before the start of the buffer: 8 bytes
> for IPv4, 32 bytes for IPv6.
> 
> ASan reports a heap-buffer-overflow for both -4 -r and -6 -r. Without
> ASan the read usually goes unnoticed, but it faults when the buffer is
> the first chunk in the heap. That happens on Ubuntu 26.04, where the
> kselftest runner wraps the test in uutils stdbuf, and txtimestamp.sh
> fails with SIGSEGV on every run.
> 
> Even without a crash, -r packets were sent with a checksum computed
> over unrelated heap memory, so their UDP checksum was invalid.
> 
> Build the pseudo-header from the destination address and checksum only
> the UDP header and payload. -R and -P already write daddr as both the
> source and destination address, so their checksums are unchanged. With
> -r the kernel selects the source address, which equals daddr for the
> loopback addresses used by txtimestamp.sh.
> 
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
