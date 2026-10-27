Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103412;
	b=3zgaiCKjQOovjMZQYczKOrykc88BL+ahl3blnNLsq+GEWGCZo3IXmbN0mCJmlO97geai
	 AMvuJnU69/A9Hg4EVvcMhbOZ+i8j6rT+DTTcRwBh0WxTVWJeTq6rt2MSJ09rTJ3s81vQs
	 MvmD/rI4G+OtQWfopYJ7/D4oZxxQmKq6VyUvyoc2budUFpjhozRcyLV6k9JIygAk9XTsm
	 mZOj/n6TxtroB09fUzmvOeN89cVlKfP1zAM707IYaqE9Foc9He8al7a44kVl0hmf7I0Ec
	 5I1o8gCKKyklPaiWSIxpBcU79fiTYGsSPR7qybOqqQY29vjpkbAQuNY+udJcKYecq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103412;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qQ58TKr8MXey12izNEnvpb2aLK2HSWoN0TjptAHNG60=;
	b=11cyBOixL+weZKj28XTH9B/kCMGpf09PB45/PPOAouw+8EANWLI5Mr5G9MXIOPXa0pw3
	 242ZGTvGI4N8Wtkkv+Vyf/BrN10XucDtu8qAAg5k3C4FWTtM5qOBAtJSJBoW0euzHuL9v
	 Vo/l6Ogv9hxC1YHDChKOJRq567nDC8yB1RIJ9IIfUFJ+hlFDrKWT6+/fTS1zGSIG8bUp+
	 Sequ91ShKv5xrXPPSZd+X9WqytmZKDpziv14detwwVbVOKwqdDP3jub53qBJFGmwHIQCI
	 CwL2KK77e0xeHyHgK+UB2OBcbkLtWqMaxjTL0UhsKomz9hweVyrU0yC4EJVsHxXf22Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75039606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75039606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd35952so373538f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103411; x=1793708211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQ58TKr8MXey12izNEnvpb2aLK2HSWoN0TjptAHNG60=;
        b=k9ZEGUpTDpjG1fJmi+egSF9XvQgePDss3rZmJcXyYhkzJ4IzzMzHPrB/LAZ26o3Y+t
         kJAszWNFd6hfizOsKOcCaDdMYs7Zm6JzBpuldg1SU4VY9Dx6PrVNYLTD5TFvnECgtIq2
         j5eGmtZOg3wPVua+HTue9j8j/c9JnaIPTO2AI99CbuMOzw5whVHmiv5B5N0Zr7ie8jph
         MAH5PqFdvH+ujX3ADyCDsd85lw76aOp8+bagn32nulA1Wi9O8Vd0GytiGvAGH0nUtkPW
         wYh0WzNeYluYDgvKpoCcGY8rObyr2WVaMhgZokF1dkIx6nNwmZO6LjlrScShB+HU7p8M
         IU/A==
X-Forwarded-Encrypted: i=1; AKwUvBzO8S2AUoPZ4fGD0NDDWO8dblgrJ5Ey5ea2/hsGB8DmhrNcwX3uRlR6/+qHnToyKxTFemvn90hHHScyiDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgDqzuxvuoTqRkovANlJVAN5SNmr5SzNEaiwmfPLmJsMnSfQ6L
	Zu9TWoEg09mzBXR6kASzrSORC4O1TRGmJkJbykZzpjQb9a77fVbx2f8l
X-Gm-Gg: AYBFou3LeUKjvJ90pP5Sqrxr5Z2W0abtuYBOiDFNAvsA33j5Uv12JVeIQXRhwmzwYii
	QRTxBO34+5itUe6TLi1d9HjWTKuPb8iLVGW4yFVH1otm5gYmlqlP0aBX5hHhULz51b2ePk9u/TO
	kiisANg7Y4abhGODgeb16ppgO7EnXYzFXPmh+nKGooz3jFMOPhEaXR+YyVUa8ez43CdYr53Suny
	AsHDRweeK7L0GCqoTPII4KtqnTZg5mQna8lA9Gewvp9lVRTaDVm31cQQQsPgYUif3lKQoBWlnD1
	dOE94P14qZrfjczVRkGOAPuS+0/aCDzptoVYihntp8sCT1JxoIfI6wqQCvh4oOa1TyMmRU7DThx
	+kBM1XIIXy0Qi+NrQ5vChHt+AyuqczHbn5wayU4j2R5zUersVdKtg6mLmtPsom1zX4+sJYNTd7c
	LeJnoYjIRFsa7iUGiC/gcZ8lp2HiFrkoQ0PnaEnvZCu81nzru0RRjq4j83W5diy22AqfQRBEsHJ
	yKx09KwanXe7WpbguVyaHnGtCqDyhoKSnXxUI/rgPMKHMFBId1cGrF6es7ACJ9L8CUjeV2ZXANM
	2xptX9LrZGsQ0OUhYw==
X-Received: by 2002:a05:6000:2905:b0:48d:f14a:9186 with SMTP id ffacd0b85a97d-48e3eb97829mr22056835f8f.6.1793103410734;
        Tue, 27 Oct 2026 05:16:50 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm21108892f8f.7.2026.10.27.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:16:50 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: jack@suse.cz
Cc: brauner@kernel.org,
	willy@infradead.org,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	aurelien.desbrieres@gmail.com
Subject: Re: [syzbot ci] Re: buffer: warn when a buffer is attached to a second mmb
Date: Tue, 27 Oct 2026 13:16:49 +0100
Message-ID: <20261027121649.69819-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a7h6k7ecnmnj426ss45fqdk2kjodrjurjpwhcwao2bjkw7tqtl@qghx3vrx5ber>
References: <a7h6k7ecnmnj426ss45fqdk2kjodrjurjpwhcwao2bjkw7tqtl@qghx3vrx5ber>
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

On Tue 27-10-26 13:10:55, Jan Kara wrote:
> Woohoo, great that we have added this. So now we have some filesystem bugs
> to analyze ;). At least in ext4 case this is a real bug as xattr blocks can
> be indeed shared among inodes.
[...]
> I'm not sure about the FAT cases because directory blocks where this
> triggers should better belong to a single directory. So it could be some
> race with freeing & reallocating blocks. Needs more digging.

Our mails crossed; forget the pr_warn alternative then, the WARN stays
as sent. If digging into the FAT cases from the syzbot repros helps, I
can take that on; say so and I will report what I find. Your free and
reallocate theory also describes something beamfs could do with its
indirect blocks, so I am running xfstests against the warning on our
side first.

Aurelien
