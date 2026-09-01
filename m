Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8101DED49
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280698; cv=pass; b=DjKAnN7leW9oGWahsJfpieV4tYP2YNGFkPVF6nEi4CkbMa3/GwcIQQ4hW1c44yyMb0/aOe248dD15mNVDV+Ilaj/9/awTlQ+YBb4VMmqfan12ZCnifUiMzqS+29jU2cVDqu6kGMEmzHWNDQ1J3Z/YN4uUlYlr2RWw9CXYOxf+vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280698; c=relaxed/simple;
	bh=E5rJhWWYW+3DExYvc55pg6QlitpW2bU5Ma2FTann+ec=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhpIenk+WQ0O7wbO5NhHp+TaU9Yt3EonUyZKcMeq1/gMrkyWUY2PflnyVlm+p3qrZSlnfQqTH8z4lgJeB+vqPSgA8YHlV6goUDPNMh966m4M5Whdkhz/lOt46rLnItgciRXF+SOP3PhJU0AD3UoPT4Zx8GDO/+AMg8RCq8V2o2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pl7ycjZR; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pl7ycjZR"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so34482a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280695; cv=none;
        d=google.com; s=arc-20260327;
        b=SkiZQTJPpUavtkZHcULX+si3UApiust99v8yM6sqzUf5cmtNimaPsMtw0zQ3zaw2As
         wLCxuBa9eOQPlkCNj5bB+ckPG7cvOs42nCSRfj7CMFlQ6tUqd3e/o6l/95RUNSQdi5jv
         5Z4vnxi+8xZGzHnyHBt8+ETol6lHQvSfNUMWVEYMtSN1bTRjR5RY0gqcw4UJaEK9BnSS
         Kh7410n8kkYkB1dixbJZQE09fESjBgEC3sQ3O+Dh9FwLO2nE6wQl99t7edgEH+erIfN5
         ZINO9ID5n6o4H/3ERUWylE9JYqerfM3mFz0D8ecipQFUGCQc129Ve3/861Q4gt7rGfG6
         eONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=E5rJhWWYW+3DExYvc55pg6QlitpW2bU5Ma2FTann+ec=;
        fh=dgBJ0DctROrehUzSu9rn6qaGrqTJRk94D63pT9yNujo=;
        b=EW2EMXVACEmS58hFLAhccq9nwpbu5YTSbf5SV47sY5GMZz7E3ojCiJny396aX+IW22
         +yZXHstPHu6eP7b9B+kvkSLeel8crVKWglRQ2VgwtqbWUYZwR2G2vXOb1xx3WbmEPTBi
         dD3R6OKnFdKiBwQgovYT655bY+nB+K4XeFldbl76Nwv2B652Z7A7uqWSv+NOkHM+hpnG
         fHzomxylxLySGVLUre/SyWZL/KacGHWaEqVJ+hUoP+N+ks10sTh9KvafRnq7ZGq7F7mG
         X4AnxrvdPXjwQjrtTSgz/U5DY8OkRi8MclilFPEwSnhzhJlk7u6B73Z4OWIHBZefbKOM
         piRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280695; x=1788885495; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5rJhWWYW+3DExYvc55pg6QlitpW2bU5Ma2FTann+ec=;
        b=pl7ycjZRmyJ9oSiHmo1P8EHuwbW714722z6L+REGV4XdUKp1qufYmakynxazGYXyDM
         +PBRsE3+fVlb4qbi0fWvhpxJlDtEqDMQGSjqdb6pUDcnQHKui0rgKTGr0BFB1Ff4mEsX
         zPQprphAO/o33of2AFbqBbN/Oys1Zr6Xgof0nV2XogWtKH1kFqwKYkcxqjgYguZm8XDQ
         ayYQCLHo8ZuWR3wQ0cNerRT9BIk7sSwl2BPhQECBX768t5Dm68VzPEBIUVbRU5GiPGjb
         JdVriGy8VXhBqDwj0pNvsSUuBaimbQ8b5MbSIQHn9CBgO2MNQ5/beUhfXiaH43N+hLnG
         UdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280695; x=1788885495;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5rJhWWYW+3DExYvc55pg6QlitpW2bU5Ma2FTann+ec=;
        b=HK7X9R51wKCxwDA8ZwpD2Ueip5YLY++1+DNHezrI9AMhTwpbgOzi4jq4W9OoBuZUjt
         TKO/nztsxITzrPprC0KijDYGw3blLRnkwZPZrpCty2Fscae9TVbhrXb9xEKsQ12JBIDG
         tVQ8pOcJIPnl0hfJh7dXEIz8bm9WFbCHpZFmNL8XWB7UKl9AawjLjTZfT6xwaUKaVY9z
         B9VxhH1rhA00Ol9BrDQXZPfyhCReFw6i5FVBSJcWw/aKSHsriaPa84ex4lhqjVwQDYI8
         6k/ubIw/5yckDUp6DkepnpEe7Zcaa/VZZ0g41nmwKCfwqBRuqbpF7rTS30uh3ZZdyCA6
         3mVw==
X-Forwarded-Encrypted: i=1; AKwUvBxknOYVJFlyIC7ux4dkLFAWDAEBwA6+flgr1WVKNUDQPZdanIihLOMMqEKMMHOUIAVoNZmSptTP+/MJ6dA=@vger.kernel.org
X-Gm-Message-State: AFuF++lJsCyql48rxsukg2lEMVj1//QudkHm+XNSRxC+lKZ7ITSsx22/
	xA5c4jG4WZRfq6p5wFv3ntrvAz4hOvylac9QWdooM7KRxxTw5RR1/KTNllqnwXJWRethV9wEvcq
	jWavQ5bwqd+IL5QhulFx8bx+rHY/etu3pbFgPd9U=
X-Gm-Gg: AYBFou2JzK7WKUSW6EWKVydJjnVYGp3cpvhOzJxgeA3Q/Cq+9dALAZkvO2D2uz49OHe
	RHfgXXyyuRKNkii+jFJw2NL5uxMprK5Zl6VharL68PBbpnLqURiOkOmwkMLpk2woxgUFDrs86wt
	IBv1SJTVYGGAA1FQIDPmHkKMaCkPbmxdoDJiu4tdp3RUYJPUTelF5rx2qUI3kYhaN+z15RxXtJ7
	fsBOXkTWe3eeh7pqJviuVw1ARJLAIDa9gUsKa7w63LUd8NYVmrM/Asa+S2W+J4Ub1rvXhJx6V32
	XZ7q7T3csBZdtPSkkhvVuqVnicJzDOKUMwCHK3bi9NOGYV+vnsV0oU/DRH5trLt38IBJx6foX/3
	4+wMcgNR0mkrr
X-Received: by 2002:a05:6402:52c5:b0:6a0:9776:cb5b with SMTP id
 4fb4d7f45d1cf-6a663ab82bcmr7333920a12.13.1788280694622; Tue, 01 Sep 2026
 09:38:14 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 11:38:13 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 11:38:13 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <63f1e1ae-444f-406f-b76d-312cd0b76bdb@kernel.org>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <a21bc0d17ce657d0ccd86fd398785b946fa268d6.1788213716.git.zhangxp1998@gmail.com>
 <63f1e1ae-444f-406f-b76d-312cd0b76bdb@kernel.org>
Date: Tue, 1 Sep 2026 11:38:13 -0500
X-Gm-Features: AcwNN1Wdz9amKGmpbEpp8kdOK6krmeggFrDAetBFf9ciHhRr8poaSQG8EaTT7qE
Message-ID: <CAH=xXfG+djih687sXuzBD=0nP-hndziUgn5LU8_Vzu+SZoTHRQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/11] f2fs: describe {i,d,id}node block layout dynamically
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I have moved F2FS_MAX_BLKSIZE to the xattr patch where it is
first used, and restored the direct(2), indirect(2),
double_indirect(1) node IDs comment.

Thanks,
Kelvin
