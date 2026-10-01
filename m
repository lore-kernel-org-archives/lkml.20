Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561534A0156
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859139; cv=none; b=WgGysOA5j8VUR66pPzPxrlnM52TL/8nEd63ij85x6im8ypqErREiYx4TUeTQFIE6syqTjs5uEHiv6siqlKtmTtAginOL0vhhhdJYK5t9JIPb6Ipe2CawEl597GPxX+eWgHyrAiGWEa3694e6dDEcalwpTGbKMNPfF/xtIX9Fcho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859139; c=relaxed/simple;
	bh=dogMI81wefaNA3bJRQNmeNrah8qHK6X0hHk71xmIfEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU3VULQNiVMMqpsqxZuIchGDHTEXpq7+1NDCfsQW/vR435jQonpWIKO3RQVzFOIgcF0+toZNpEuVm1zXefPUEJqVGgSj/+rZSDaaGyYLs7Y+b11CevuMFy0K64Q7G7GyqPzDrmaxMjCkB/jUOzybbXPNJxYc12Bo/aS4V99/Oqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Hsoku8Pq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Hsoku8Pq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso17193755e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790859134; x=1791463934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dogMI81wefaNA3bJRQNmeNrah8qHK6X0hHk71xmIfEY=;
        b=Hsoku8PqtIw8yW8s8VVkgJ6aS867WLqFHHJNtTyOXJ1I5o00YXSG0nSgYo1eDbDKnA
         Z1R/DkIrzHbHTu0njbtnYCUM5WEemLOL3EzOvbSoqVwoF/IWjsBEh7P8NjV9YHh41KoZ
         UsoDocabzKqnyEeUak6gZ3h/+tUJ8mjpQV/L7wMWe0dAlg3NKxec3UwkkMGil4yFom0w
         WWo5I5nbnd8pUXf7mRqxbtR+LExyrRUpCPOTa8qurwOjj7avs19BZzqVfSeeZWxD/LSw
         6EoyKUYFLQIucCeh7jJFGV6iRbb4GCA5d4DbhgtkgODlRp/fNdmdARgcWMsAxU/bg3hG
         xU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859134; x=1791463934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dogMI81wefaNA3bJRQNmeNrah8qHK6X0hHk71xmIfEY=;
        b=IZyyB+pkTq9NRnVbEgzchkgT0luMAafmbgxjE1id8V90njg1B1ybHytZoql7Vv6qni
         uCsj0Ht8ih4r7DtM8Lev5wK7dvhQdjdA3ULOXkiwcoLtwDySSCJP4RLaTJwLbNPuHAlZ
         8JTREULmoMIzDczuVn+Pzzeba4lpYAYPfH8PYdYeDrmNG3Y4H7qyW4iqCkwVGqyRGSJS
         1jktKgQkOhStwJG2boyh9OTV+IhsaW7e1TJmFcLNrmF/t0RnTxcReD1C0bVRfeU82lgc
         C+NIWELrlD4UEWZ5wNhEykNZICD4S5rGkYiSy6Fuasoog7dc/mtFjBBbuH2N1dDd6yx9
         HWMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOMATjsXhDVlB/rL2gdlDv0eL8D2tS3nWqcQGvkznlC/bKGfKkZ6YJ+puY5l2kgKCQVOjQVPuTnEHKx9M=@vger.kernel.org
X-Gm-Message-State: AFuF++k3LGEmAl++FACrzdzGU5IAdz3qCFRVq0uB6HLZpOHxA5SFzA3d
	MWFB3680y1nAJu0dgiY8sflOBKoltmlyj9nJsF6dXE8PU44Z3yHT5AsS9QhZw0/AaIs=
X-Gm-Gg: AYBFou0DLghJpY4bz9yqChkPBeVo+pdyq/geWDTMNkWtlw+yE0/kifGqVQmWVmjb49s
	tfT0lF1VeBo/Hzs0g9lVrufTm2IzgsacpkGzjV4XOejJAHk9PLrr9+UQYI4PJMqvL9U7hkQJ759
	5zNyj9m2RVIW/PZK9B5YCIgyHauwuj5H7X+LHD5fInAAJiB71FVzjYGwI9E//pjkV8W4KNBdzoe
	XG2F+0+ZABvwejD4R1YLaTj2LAd71hDN/0/kYDze0y47BEaMjBjTt/ZmaKK0YzWlwXmZyI/0H7V
	TKoR000pg+wj6mSi5WnunTR3wE70HizgExzN+Q26FwkWEqMicS7rMyVaJ32nQzi7pb4WmaIlatG
	hqv/DbNpP09MZVdLstEoevaoJcIkiTY0eDMMyVwBNSWF836clPLnuJOn5oa4w/uArH8aGj+Owj9
	3jlUM2RF3am1GyqTT1p6KhBQEzQ/3WG0JWGoedJtWU6NIQoIABz1bGA93BBIyidb99NQ0hDlziS
	VCSnYSm/FkzfaqSZFWVyn6/uG5VgVmZdxH2r0ZU18x/GMYKqSX8jRqQ11OJyZ2Zl6n6m1V2gXMP
	dU4t
X-Received: by 2002:a05:600c:474c:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a020b4bd9emr35767235e9.16.1790859134102;
        Thu, 01 Oct 2026 05:52:14 -0700 (PDT)
Received: from localhost.localdomain ([197.51.130.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm100008005e9.12.2026.10.01.05.52.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 05:52:13 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sinfo@kernel.org,
	Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] amt: pull the AMT header behind the transport header in amt_parse_type()
Date: Thu,  1 Oct 2026 15:51:54 +0300
Message-ID: <20261001125208.27182-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <21ba1323-7619-4721-bd1f-9ccbae42761e@redhat.com>
References: <20260928181557.85796-1-omar@blockcast.net> <179061960357.31693.937915571809434718@kernel.org> <20260930222733.47563-1-omar@blockcast.net> <21ba1323-7619-4721-bd1f-9ccbae42761e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 1, 2026, Paolo Abeni wrote:
> Due to all the above, plus 'broken since the beginning' and Linus
> asking only for critical fixes at this point of the cycle, I'm diverting
> this one to net-next.

Thanks, Paolo, net-next is fine.

For the record, since the commit message overstates it: from reading
the code again (not reproduced), the byte read behind the quoted UDP
header stays inside the skb's head allocation, so KASAN would not
report it. The effect is a misparsed type: amt_err_lookup() counts the
error in rx_dropped instead of resending its Request at once, or
resends one it did not need to.

My reply to Eric promising a v2 with an Assisted-by: tag went to him
only, by mistake; with the patch applied there will be no v2.
