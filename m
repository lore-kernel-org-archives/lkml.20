Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483517;
	b=xHX3camtbikk7Xttz/FgP/M5qwV6vClpYeqXbonpHWe3yywyDNMGWmdchvZl8jJHGPRP
	 dq95xRwHDIH3St3YpR/7WZNDC7qMv6U54ZrPzuFJ5m+mV/QUds/rpzaO9DlOzsNEZMKqe
	 0YOWtmhpACFbJowz/FJXqAwM+ZjlJP9n5btrhRtRmS19tyYcqlB5bOINSYqwFKb0mhBNf
	 k2VQO6FJiridqwQ8K2d8FmqFIY1XaZ8JX7DkA9bXnvsGOF8lKBrNxAI9ZgMKUBw4k78vB
	 jiFDmBqGv0MFFtUT7TwqnE9xvpxjdupEngnXPf4E2+pP74fGWtaqQR8Gua7qJiaaeuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GPg92EprU8pd6RZNS84knIcONGEuxb3GDBAmGPh7pqc=;
	b=ezf2wqEu/le/3YxilyvtF4jXBvIz1KhYXsDg58dreWBewZKrTIium9y/1Vb3mc6SzaNM
	 EvuqO/mNOnLrExscs2E+RoOJnKoGAoEI3Z4cQtxL/4Kywe0dK3ShyqWdBbYbQ3qCIdjSE
	 lurEdOvPiz0otQcF41WhWGGZ+X7v8RurCUsfj+1vpWEDEfK0rm97J89igWKG3onDJTONg
	 IBY5/Xd0ukkD6Ee3NUlfWapk3Pxh7yb9N9UrrpJKsNr/A7t5wU+KWWxwY3WoC6U5nrQeJ
	 4E3uqLWNXOT52G+6SWvRvz40LE5bKePPX/1A4AeWH2xCCHuO2rwvzYg68S2EGXuuotg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qFKnXVQ1;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E59B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E59B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qFKnXVQ1
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bce4e278baso549849e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483515; x=1793088315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPg92EprU8pd6RZNS84knIcONGEuxb3GDBAmGPh7pqc=;
        b=qFKnXVQ10drmnI4HN5aRXpeaLOJkYq9Tab1fnPYppELjXVdHUSWEp+Dk1VNn5ENReb
         VwzP4JUSbupg4lvvQzvzg/36LSOMH7gG/w2Qar9ZI+ExP48nYy88fQzt3H5bv0FTd696
         eC3KQ4TvONuZEL5tLNguddcsvPPss71h1Q6yJHss3ENVEYtGTHxETQAgx1ETPlL4Purg
         LbiCMljC6M9zRqzNLy6pMf1A8jNVxhOh/w9t/OPaxi76TTDqxbPF0Ez44yM3cxkVvwe9
         Mj6KMw9v9eqeb4tv+TcsTCSqVk0BqCRhIEqNB981XV21I70KGJpxyRNW0dmmwq9//noK
         rvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483515; x=1793088315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPg92EprU8pd6RZNS84knIcONGEuxb3GDBAmGPh7pqc=;
        b=QX9DxCbplLjin5NrtJMBKXgFM88WNe+p19wQ/ot6NK8AlOP/jmLCoqW114eC7Dr9ro
         jGndtu0JoDcDF23OdNm9yIBB8BOgR7sbasnv6mjE8DGrFu2sOsR0GUkWPVwV24rAYD2p
         X0O4kMsgiuhYrCi+DYKPV7fzQOyB9QIFMq1GALtYR7hICCYu6i0j9Swkchl/7Jj9JZdn
         9RrzCnSSN7u7mM+UuTexcO0PSpDtHjS+XHXrLJEuvvZ7NqUBd0w9EZV1/Z/9EaY43Jk5
         UoSB3p8XIrqJr+YQ9dVG+bLhh87BZnxY5tliA77aVCHDYYYOqwSv2NUDqUPJD/dRQil6
         l82g==
X-Forwarded-Encrypted: i=1; AKwUvByPATqpifbZDsAPy0Zj3+aoMxvbNZGhfvtPJ05KE1QqWmPq7b7chnUvYjWXJEdBIKk9zXhC8jnu3+kebCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3jt1WFpczqu69nzS2Exc/ssBqfZHGSl+hQrYmxY0sbe02cNj+
	lwI8OHhOYoXDuBUUwnX/7QVFiinmNGX/2XXu36duCeu0RpvUZzlGmiOQ
X-Gm-Gg: AYBFou0Y0M4OFLu0StjxH6S7ZENrlqT8/zdzjSoCFSw7LZ6swAxK8fcb9hyxai6oQOp
	ngfu4ymjOp2obfUae9kYTNSqoX1LyjtWJ84812VvYtV2yZRvjBuIfaVOsfHt9xT9Q4rdOvqRgB/
	fa8wxrXPzcAYK22XW6JcUtTZuowX+k4cf9oK+IA7db2Tyc3WO3hTE612yJFJOOn5iPJRvx20Cw7
	ah8ZmlsMprQDiw7BfJwgmbnxbIfObI3eWICRN20CmAI/BIL+LmfwgfsoBZ26QqFJKEhZjusrTQ4
	gLJFWJKMfjkQrsRYECAqN23itbRCfGkpOulCpOtonnDIhLEYJtD7AJzaWNhw3O6BG4PfHVNPsGc
	3nkNvaSaY0lcPrRYjH/qxneBMWSQokg7y8NbNrWTu6SM+AWKyqnoeUVebylFdum0ldEkgmEB9sk
	2W9VSbSkhAEdDXj9nd6iEv/zFZvvMRWFP7Lp60yCe3zY36BK2x6q9/2HpN9kf1EFTJQo0QOS5Qj
	6BqG9PmHg==
X-Received: by 2002:a05:6512:104a:b0:5bc:f2fb:f4be with SMTP id 2adb3069b0e04-5be66a23f9bmr431809e87.6.1792483514495;
        Tue, 20 Oct 2026 01:05:14 -0700 (PDT)
Received: from grower.astralinux.ru ([38.74.72.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42b330sm2424863e87.15.2026.10.20.01.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:05:14 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: gregkh@linuxfoundation.org
Cc: alexevgmart@gmail.com,
	co+0ea1ac045375cf05@bugs.sh,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	xmei5@asu.edu
Subject: Re: [PATCH 5.10/5.15/6.1/6.6] vlan: require the MAC header to be present in __vlan_insert_inner_tag()
Date: Tue, 20 Oct 2026 11:05:05 +0300
Message-ID: <20261020080505.279102-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026102010-hazy-clear-1f06@gregkh>
References: <2026102010-hazy-clear-1f06@gregkh>
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

>> just a friendly reminder
>> 
>
>Of what?
>
>There's no context here...

Of patch, which is first message in the thread
