Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648350;
	b=zNryK1qQlxiHoA930oxQumwFeEMRuAmNfzOmHIs1GNwBysUKVCjYkYQETXkeWCRFpQA9
	 hdtKmkBZ73oSAXShaZYNU728X9GTososCE67FURs7iDF2rJL0lEq00o3atwOoZzNk4/95
	 AUJNs1e/rlyKsLmoGWs4tWn672hMBwxA/8F5QEw0zP9GeHct7w56Cjk8x2uZQ3wXzTBRO
	 Z506jB1mw+1YnoZxN5qFny01YndgKM9xq96xelnkkBAAAgWTKvOi4lJj/1txlRq5Fhkf5
	 VAT1CaBUJIV1OXqg6ahcPntXgeHlrTqky+oYBM/NbYtIxTMMg3dmQDFstOMTPUuqSkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/mZCd16s0rOJD8RvwqMAPGTGJNlQHWt1x/I87qRDNSM=;
	b=zQFcjAnd98tLtcTW7JX/LaFN+9poMKEKKCyTUYwg/cTBerFc8mXd40bzbO6g9f5hbCF2
	 O6fN156hDMjSdoB6/0SGX4mMIHtc6Zq6UvXA/ogBeBcT8p216XuyWXm21eCVd08PNsvgN
	 IMap43wAYGgwtF944j84PcuihBR5TDzQ6kVMdCW3o4dOSVDZruXioRGG6oGMSAhJoMgtq
	 n+N0kPnJgkIut7qW7aG689CDoKkTZBD8Ii2DfqT/pxQiT+g8GWiSSoL3Ph8QzLUBN02ZZ
	 B87tl5Bau8CGswtIN0Cev87FNsJuqZlUeJs3dLXNSuryXr7HqykMFNAG/VnG4+XFITA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWvKCEOv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A9606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1A9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWvKCEOv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so13779925e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794648349; x=1795253149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/mZCd16s0rOJD8RvwqMAPGTGJNlQHWt1x/I87qRDNSM=;
        b=nWvKCEOvJ1zord+TkQ/lmJEI9fAIXaf6FyXXOq2gD2fiKMwkgCC/m+VnkIPljYmnxH
         D3s+igShRxFDEVr20c9uYMRzQ1phcOnXn4iZn9+MswCnq2JRYIqmdtKYnOsty9/LWTbr
         CF+nqwd4zoEkCR1AmGpKY7oyl+MIVgOdv3KNePMNajkVnUFSSkgVlM5ANb57AjoqQt8W
         LVq+Ba/wtdajYbFXvOd+fhBFYCdm0tdZ6rUDfUt+QrWECoTTMzqxdRkQjtHuJID91Ywy
         4OWK5T9jfAbJCmt7I99QdsArPgNalPd8v72/bCzRzO/LZZfdRmWL+kAAxZIm9FvMYp+0
         Lo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794648349; x=1795253149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mZCd16s0rOJD8RvwqMAPGTGJNlQHWt1x/I87qRDNSM=;
        b=vZsaXklKEnh4x3IqTcm71NniRXqO71EnYOM6Erujn9jw9PmmZMnhrQ8ol2z9u+IPVN
         OcgSnfrFCqn4GYAzcxg5jspuPq+yi5H8O/Vyl1rMBAWhqRmI08JfF0fIQKgP33RnFqoq
         UHa8ejkcuJfgYtYSGUTKTwaCHWFzRiDmy//UOTnJKSwdvjm08ce1+8ihKgphdt1+1Nh/
         tXMitIgEfXpxDyYLCzJSYR3+Jraj2Fl65aQ8cbWVvGgCoDA4F/s2aMARDGgTJypJCi2k
         H3RzMnhawV4T/YNZU3gfMOCfTB1zereDZTc/3yvJL0mseoeMjVGEtrn5u5XauRlmvwN+
         jz7A==
X-Forwarded-Encrypted: i=1; AL+hErHy/clP5eECMTd8TqGhP43tL8SkQ9ZnRuWjO+7W7UYnYe5xwiK5yKK/TiLsKsypnXdbicCVb7c4s3ggpfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JOrRjE0WAMrCWl8SZ3iVhS+0vKqmRyYpR+OsF2HVImIk5jlIh
	oXtgQiwG4fzrVcxvuZKu8LaMk+Q8qHRdlPPAOHT1H3gbquJ+t23S5wgu
X-Gm-Gg: AYBFou0bu0A9Q9QqaQPTbXChVObVlCGoXuWxPPsU/qRDqRRoi9T50qsbYXuWAsZz600
	lhC14xUjU1zKo4pr8eJ6yByT7SovdH8MrI27F4pkI9MQZ5BecC9NwQtXESzM9/OZwKjuD6MTEac
	XOzCHfABUPk1Dv10tYrexZdHepMKMidxLDlebD3u0K4oWqTJm8FZA03rOhHkPC4JsCntwvedNbf
	wpZA001gQ1gdLrBErvEl8I9Vjk09LHZ3zaijvSU+Sank2348kLCcCIjRwnaQmuelzVqSqWsC/0Y
	KK2W2JSLPHxB3YTsJ/YwRupW7A63yVg3JddY/Q2ix1rOB/w0ZiZsqLv3ct4BmDnyKymZ1/l2nBl
	VQSrbkXruFCnQMY56XM/EjeBs04VqcU7W3mMsw94OqKHn3haoQ+ARd3xlRA9UGKc3xMxBbWe3A7
	JTbsVIypBq9RAFzHyHBI/r24Ti1o8wOdiVa58pWlmOzcxj/RzP36DV0y84LjhyJVGMTWf+W2ItS
	fVSSoQSa/7B0Ik5z9TINoWvocyU7TcfA9WsE4GS5g/Xvx1TZjli/2rezu6KPLfJfnkCD4jJxSB3
	7Ib2GoyZ+jGriGv0DZ3POLPriXIG+Z+Ocn2VySMc2xn41sVLor6ZY5I0vtxlrsyij8KfgiA9LGF
	A+Op5sIfmxbr9StHUKiSElKqU1alprcAiYIHGUDOxr/PV+WsLRJ7kVF6RU13imE29vYzMCJCNnW
	B238QbtDmD5mSgLJlngOaG0OPc4f/BNgW2rQ==
X-Received: by 2002:a05:600c:37ca:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4bb559f2787mr104257555e9.3.1794648348343;
        Sat, 14 Nov 2026 01:25:48 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b358-dd01-fd08-0f0c-fef7-8409.310.pool.telefonica.de. [2a02:3100:b358:dd01:fd08:f0c:fef7:8409])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm9295782f8f.38.2026.11.14.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:25:47 -0800 (PST)
Date: Sat, 14 Nov 2026 10:25:44 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.cz>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ext4: return an error when a journal block is not
 mapped
Message-ID: <avgo364sThHcltzC@gmail.com>
References: <20261016103726.98553-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016103726.98553-1-kmehltretter@gmail.com>

On Fri, Oct 16, 2026 at 12:37:26PM +0100, Karl Mehltretter wrote:
> If the internal journal inode contains a hole, ext4_map_blocks() returns
> 0. ext4_journal_bmap() logs "journal bmap failed" and aborts the
> journal, but also returns 0 and leaves *block unchanged.
> 
> jbd2_journal_bmap() takes that as success and uses the unchanged logical
> journal block number as a physical filesystem block number. Journal I/O
> can then overwrite filesystem blocks outside the journal despite the
> abort.
> 
> Return -EFSCORRUPTED for a hole, matching the error passed to
> jbd2_journal_abort(). Keep propagating negative mapping errors.
> 
> Fixes: 62913ae96de7 ("ext4, jbd2: add an optimized bmap for the journal inode")

A friendly ping on this ext4_journal_bmap() fix, which carries
Reviewed-by tags from Jan Kara and Zhang Yi. Is anything else needed
from my side?

Karl
