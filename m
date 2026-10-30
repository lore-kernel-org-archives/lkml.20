Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363084;
	b=hJ3aWbnLdCJH1HIRxIb+99icVgyiO12MBDm/O67ZP4qFiVzo0gXxfeTbGCHGEaPat7Lt
	 hLzFogY5WQr8bFqYu1OylJTIt2Nmz01iRoTVkqoVZE7C8PtNxkgvUXNF5gScp2h/jtkoe
	 qJOqi347GIPPBG/LvvmWI6dtJ0eyh8QJejGq2IYQ+103EqSr3or5TtQadAtnMe8ymLYk1
	 LqvnC/672aDPSO28WzFQ7kawL2OY9m3x9wdqJgZ2LxRnsPHrUplCQu1VRtZpZAYreMhPc
	 FqKSoYyLBKj+zbAlRTdYVmW8DQfp6vNtU3NE1ycH8jhM5SGFR/fZkTDIromAZfFEuOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+yrymDp79FZjbqEueI9kZqfriu2oDHzO0g8H9zdbK7E=;
	b=smhT9Fp+Oa8vTGOAJgC9HBO9+IpyVnDgSR3Uh0BthfqnVpFGl2DMIbTqLEqYIpbu9jJa
	 2/VJae9iezAUeZCK7NbVc7WvfORXwf+5q5NTp5+fhWi6szEoAHrXCDCkqrRGRbxubO1jr
	 GjdXUeRccTI90JnP4mIhgluwpzE3uL91UfJwUptH9UyUaEi0N4OAFPTMetHlO+YRJGOVf
	 RIynY5um8yTm/ZVwXPHyIe54xDRCETqTcjduAe6vHmRpK+R07bO3yA4JvwfW/U4J1s4mF
	 u/RkQ9DWVFNb4jKihvFgvduJP2TOj/EuTRMjJNGbsQOoR3oTJfzklYDrA0Ix/qEAudw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDl7HVvK;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96039606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96039606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDl7HVvK
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cdac0ac5f19so340824a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363083; x=1793967883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yrymDp79FZjbqEueI9kZqfriu2oDHzO0g8H9zdbK7E=;
        b=kDl7HVvKhavC8dBhxopELEbRq96LLaI6slGnuyyzzpW6HiVfGW+5iNPWoH9zW/heUE
         w8JVowdf9BDkIaRkb7XkvY6hKwgR0yzPfsDWcGZ/TEK3ir2aGz2DFMTmEl5ZhJjIRj65
         IaYA3vc9JbhxAqMO4AE7rw37++O1oUWN3Nmqcedd8UaAiPLTaFv3cdQA9uxOBqo02BDu
         ss3CrAEcE9GJBCtpgMGVvQtPYxRYHv/K46Bxi/obXBWgOIplzdfvA+5nCQS18C+R5zJo
         1LWEf+wYAQtEBy64hU04DLZ9zd58muabV/fqQF+M8lsvlA7BwXW74bgmo1u6xwlDDvrO
         Yo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363083; x=1793967883;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yrymDp79FZjbqEueI9kZqfriu2oDHzO0g8H9zdbK7E=;
        b=Br4rG7oEt6NmMJEw0dw0qi1tSIRKYhot38TpNNoK5xMs9qJbPeuGyg/cOQOfSTaFdr
         rV5gpzpbwkrDUQ9xnI/yRfCjPBPqi/PRgmV2Uo9bWdG8laovl8dXEQuuxUQo0aGcVuoh
         uSmqAh8/drOpYz8biyIgMLRdCe0xHX410FDqsmgIYLW85GJ2iPQ514qgpnRcIWFV2jm7
         l0cPRKmC6cdAFcjiPMObEpX/oIuEJdUw/fzrSedbogrBoRb9vfYy+WugANOtuYhP1+hh
         avbx7KQ1Q7y1QUErtHB3K7uEEJ/ajtIXisHUaiP3XRN9JJr5pjicHE4KHw3rcI4d5Y9j
         Qtsw==
X-Forwarded-Encrypted: i=1; AKwUvBxzxqaaueSCDXQMKRTHZ+IuuG2uWVbiW4XbrWJN6AvZMZh0w/USr3/yCJEpeu130mzsA2IvlHPcqzI7UaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXlXyUIKiyzc7MATlh2WN9JFQ4zhOa9NJ5xlOjfHKLEtKuGZ1P
	U09RedxI2Iie0i6Dsng+ZIReP2/qb6VGjCB2YW4tgH7ag4Mr6l3PrRJn
X-Gm-Gg: AYBFou3254YsLi0S5Tgxb+1VWAbxS0RtwKExozrb0MPbfGp0OtXBG2Ixee+uhbMOF+I
	juNSYsr5neP+Mq+P0tHUG2aGjg0SbhFpARizqG4HXuY1/36Nv9jhGyuwzTaJaQ8cno8XEuPwSo4
	GBkBX+Mptp/BP/vccslfopP8PHMID/estVyMEM1LY2Xmd1vLXcSz4PaKYBaXGBUX8rf6lNEVIu/
	f/xbGpYAqqIApIDQr84rPsZIr2K3f4OTM0hX4Z9Gshm4o/9eekF9ZSzwF681EXR33QzkM7swFf8
	FKo7mVOHb+cyb96Du+7CKPEfrIfw+SgGU7ksGcqswK10UiLDIzkzo76gMFcGcDB5xdCQXiS8gVY
	mOjJFTaj64h3wwRfOFNEzLQvcM6e8aA3jQlFcAWx+6sP889ahQ/Fbw3wWW9xB28PWEcsD8wt540
	INVue9SElrh9saVi0GoF1iZp1Rlw7bBTAEvvuxjSp/La/a8FH9NVtrbPlM0kLCcn2ocFeCYR+bT
	Tfa8/BC6gjbRV1L6Dh7cAnwwPc9j2knfXzv4LUcl1huktL7lDH02QW3zc7F3HicFIXN3ClkoXN3
	gIEqu7K1ngC1TayeTFop/W99DXbKNnsIP7eO9dJ/FU18avMxB9J5SpQfzw==
X-Received: by 2002:a05:6a00:2d85:b0:873:f7a4:433f with SMTP id d2e1a72fcca58-8a9bea6ad35mr1985118b3a.26.1793363082777;
        Fri, 30 Oct 2026 05:24:42 -0700 (PDT)
Received: from 192.168.1.3 ([2409:8a1e:2331:2850:d40c:1fcf:6319:8524])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef56b38dsm687929b3a.31.2026.10.30.05.24.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 05:24:42 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Jason Xing <kerneljasonxing@gmail.com>,
	netdev@vger.kernel.org,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 1/2] xsk: defer software checksum until the skb is complete
Date: Fri, 30 Oct 2026 20:24:34 +0800
Message-Id: <20261030122434.91530-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <auSF/bDmOW0Y7T4D@boxer>
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-2-testwrzwrz@gmail.com> <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com> <20261030084017.16202-1-testwrzwrz@gmail.com> <CAL+tcoBThTe7299eVU=tsUdi392dS9cioXX5RA5AKRsYAGbdVg@mail.gmail.com> <20261030094633.27910-1-testwrzwrz@gmail.com> <auSF/bDmOW0Y7T4D@boxer>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review, the suggestions, and the Reviewed-by on 2/2.

> Can you stop removing all the previous conversations and rather reply
> inline to related paragraphs?

Sorry, I'll reply inline from now on.

> I don't think v5 is necessary. And as Jason said you received 3 review/ack
> tags and none of them got included in v4.

You're right. v4 went out before Jason's tag arrived, and I missed the
other two tags from v3. Since you don't think v5 is necessary, I won't
send one; if there is another revision, I'll carry all the tags.

I learned a lot from this patch and from the review feedback. I'll be more
careful with future patches and wait longer for reviewers' feedback before
sending the next version.
