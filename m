Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794571347;
	b=3uw+/Ouv4t1yfwKBqpb8COPoJq+JvuV/eXGBEJ4z8eK7+8CuSG+jaLKMwhRjIVAs4zPk
	 B+JDESeSMQlUwh+c6SHcWEyXciPQah4HM9zrb04btg55xZa4xzD/Emi1OB7SP434Qw20i
	 kJ+C7WpQRFiNPjWiL3pN7362ADvh04E6F1aBo1GFluyviRce7P0XH46CQFY2Ev8mkZtvm
	 SfsfdFY+T3Jtfb4aqsEwqIJ3qfN2LKHBLy3qCi/DWxIPlnPPZs0FdmxxiT8J01H+m1mLs
	 c54TJoItXpMDjQnRzhzEttj9Aj+HRO3HUtlNYMnhUWoElNnOOYocv7Gz561AymLG1SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ReROmEjIvTuMEmhI0W/IQ2tdzlBhDNd/N1GjYK420G8=;
	b=Goo169ZHJsMEg5MzZzx6AlK7HGmkJJ0+ZX6z1E5mRiUrT3lcVrPKHwXPdzn8PgNqo2oM
	 X/mvlPVoXIh3TRlMkI2fuQaMmOzptZY4AOXuxxu4t2ZlKSL7tPS5gQK30MLCyBvDqGeOq
	 /YSd0c2lwTnsF/LlClyqxxnPY6OZVHuFN5vf7wh6Vvv5Ib61E3fToqSz0HFLECgu8HY3S
	 k/7LtKBhmQPIY7sfFReNO9Uz0+ICGK9+Zy3H/8kzyVRQGthMGE8aj9OcKdJB93gOIexGy
	 ll0oGGjc9gT4vdCPNW7QQAuRaZb1TRxbM9XFKGxED7MAQiKY9jeAhpccMtHC916lOAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmswyKOO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D30606B58E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D30606B58E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmswyKOO
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-372bdb942dbso962216eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794571346; cv=none;
        d=google.com; s=arc-20260327;
        b=AN2GsSiq1Cs6SyW5HqmZ71UlhVyNgPw9UIV5KA57aPUz5JyzUrYvWxlAdcmemLj0Oo
         9IeBnqQNkqrZZDipKbc7tojWNaq7EqcS1OV7+MYYfgIxF878EaO8ib1Y7pBgr5MQaa6R
         qcejNjARkbmz6t/geQZmEYXHKBE7trJNEZR23/p8nrf7y0TMJOne57dZV9enm1PrIlx3
         uanoLXapEKLveznd43oOYk0j8Uw5tfNMB9dvfu9rF54sD433sPrj9gbhXtmEpL20Svdj
         tzT7eNvcRAfD0iJUdFpY/CnUqeREeA7SuqFsicDnF5b2Wn5SUUmWja4Jh3Bc2p7KHUew
         xrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ReROmEjIvTuMEmhI0W/IQ2tdzlBhDNd/N1GjYK420G8=;
        fh=pKMdfRIOdRbv0CLoMHjTKOt5Zojy7f5kufhpx3/enDA=;
        b=ZH6joCa4VwgoO3wxmah3CDaN2Q7fs6UdZHwfmeOlP4rzLVvr9nQ0uEdMS56H1Dogb9
         lZn108frcp09Qshgrpm5OasAnMLkEFrQVuscs+/5PJBLVMpEhOaHVYhRmiGzXTFhG/sT
         nVq7sowp3TAybH2Y34lQNQ+Sj7nMHcuk2fEAgeCwEGwrxyqCikWwCyzOQnfzlL8R2MeV
         8BvPalGQBqVPuVJ3Ul2Q+5AFDyV8+jtVIL3VSwNugaiWUcEURNwVnV8B04pyMrg/fdCA
         bt8IpF68fdkHVT6WaSt5T84WYWBVUTIk8v2CtetNJTbwOJHZZu36UfF8GJsQ0gTM5waE
         JB+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794571346; x=1795176146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReROmEjIvTuMEmhI0W/IQ2tdzlBhDNd/N1GjYK420G8=;
        b=qmswyKOOSyVkPm7ulMyjrIO0wE1TmCpoFgKLKN2O0NhJHoE1e0jDNQJ0pxf3UeEu59
         XSof9QwGnN92ViafqXF5b2B30azf6CnmT6Z3jSi6mdJ/WgPu+BIM2XPG5uAopwXPRw4p
         0qyNTl3gE28Z6dMzOxZfbYanoUOZyFicv2bZr+iWkf8OYcWfH6ZDoU/JzKZHuS4rKDtM
         s8s9k3Xp7VxFB4l3VLavulBTYBf/sUCRFVlpLnxp0rBcQkxBlniktrSlz2V7gXSZ0YWC
         X640KuFrecW2oJF8fWfHICRW1AbXQGps9gPm1lRlOyTtCNMMZYf3MXvkbipRqeKQN0NO
         ad5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571346; x=1795176146;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ReROmEjIvTuMEmhI0W/IQ2tdzlBhDNd/N1GjYK420G8=;
        b=PFieNBwp2sHtXHdtfoS4Ji5omhrzILuomSgpFriDdUMt66zvcn1U+TO7ptfLG0KAtN
         t861wvxT5iFDaH9sQ9UFwcAdFw/NXVEJXI2cFKXbthb8SsniBZar4IEoRzY8lKw/F07/
         UoRd5iOg0FZP8oyWUgO6R32qLbYOwywuK1FRSzmTRk3VGY/9OaCJGYDRQrupFGoi2yjG
         qdSOAUAUY7xPEyQhwQsEvMXXNKCjKn4nyi7e/Fy9/jsR4h2QoeJjwN16gNTXXbxWnABl
         ZCpIfDSBt7ksWyWybDK10CmvZ1OScubkEMhmmA7J4bDlfnoCiXZQ9JoVnxKvsQZ7qceY
         Pyfw==
X-Forwarded-Encrypted: i=1; AL+hErGjqWXpiBsq/jrjkw59ai+sCqJi09EzTDMIhr5z1clxTJGYLeAFYWEZiT7dXgS2WQk+l2q2ow9HgfVfQXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zQjmX4BHfE7NvqaAtPGNixFKDtT9bO6/thOkdna65zIZ2iimf
	mgoYhPFndhZP7KqRm5aPjFyTYygfWZf+5TnFnfyYIutSCg8KIwnzqDVyrXgXUCBmdMkJiZF/rS2
	UL8woW8hYS4CuNlYkLwDT1txrFMQ+Vgc=
X-Gm-Gg: AYBFou0EvO1TeYI65X1jsSL90sF9wj7ekq8V89vG9BKO63vHiryrK0Uid1PaJ84hRIY
	a+5QM1uNKiOIgb6GuIAV8TYpAYfsCk+OsJw9vWVF3Tvce75AvgpRf+4jYJRRKZzuPTaIptDJYmI
	GnOnUQZ62RGwPYcyiXID+uvVON7bjs6yNOUD/MGUGO6wAZeSt88yFqz4HFq4WcTzvmNqSjrR/sv
	LJJmUbgGqYfMN67Z+G+Kag3JErrDFv+guY6tomY00EHZ7Q2kkUKpkunxoOS1YqEHQ8m0fkfQeMl
	VJURq7pHhu1ZvOJu3YDLk2rjW/+uV8rhQVkyz58BqgEBCcH/dJ/CV+3Kq1CATZ3x2usoIXwbKqT
	p61KyeStzyH5KCBoIlpU7VVYgbxIwX+BFOzDDysHy7f0wcAmlglR+xKTgEXo7uovP/wKk54UiqU
	M7MmmOkXSr3brt/jZmryA=
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id
 5a478bee46e88-37969089a16mr1901966eec.40.1794571346295; Fri, 13 Nov 2026
 04:02:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Safocl <safocl88@gmail.com>
Date: Fri, 13 Nov 2026 16:02:13 +0400
X-Gm-Features: AclHuK-I3S_uNRs6XkqtY-AyfnOFIwCa91E2Yj05R8GXzOcZ2SotNe0TIhL9TjA
Message-ID: <CAJtzy8Lj3pZLZUha=5SS4QfLJ-_NzX_BiVM=JS-xAx3XEejVVw@mail.gmail.com>
Subject: Re: [PATCH 09/10] sched/preempt: fix duplicate extern declarations
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Safocl <safocl88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

but it contains `asmlinkage`, which includes `extern "C"` when
`__cplusplus` is defined...
