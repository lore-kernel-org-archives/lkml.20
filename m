Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873057;
	b=1a+Vg2ppRg/zJemuOzD4ekV9smyx9u++i+XpPepoLyT6ln3sua5MScF9maQX5pwujzdl
	 DOQRYWQab/STdJUThvjVId9VXse2JZS6ZxHNVzeXPB7uG/WFSv/oAxgkeHzdrHLYTh5eY
	 SnjibGtFC9E9Bxcs/9mPCTwtBjrrMIhPJPv49bbY6ZVGfZQkD1DVZzfrcK1vz561TBy+4
	 Cm9ZPNDgBZ9VkyumXzHldPJNXRNlvbRm342uc1a58xneAWfyVsYt+zRUxtJoQTX6oT1vH
	 X572AFkSpma9XU3HnuR7XrYCE15K6bVdwh6tf+2NV5qu33agfNsijF7Jrv/vZCRxMEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6K/EJIaKNDpKrT66k3dAHcz6atQzk5eNVtqmjjP5P6A=;
	b=04TVowhi5g5nsvE4NDDA7Q99KeIkFzY8yRsZR4gsitEZrdlcJQaUCllMbC4YBZiDrVt7
	 bsXDBVpifaLz19apjR5m5w3TSyQmjopJjN4RQsGmqJB2RC/XG5iMSpbR/kASloIzSH9lx
	 Fj4pbxbmV7sd6TE9WTknN0PyChmRmldjGMDcPj2Nv20aEzzmDGpOn9003dFkAUJ6ZhqGh
	 W3EVeTVE8ggXIwaqnUCLGzuR9tFlur0OjL9dO3rUozrIjM98PSkkXAV6LYU5iMrrv30YE
	 6ciY1nM5lGIkHjz4X6EKvkXMa4+Fa8oWSc/UkdIZAcdwvuBJfiHoUt3xqdmoMQ6Lg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=og6oGJ2c;
	arc=none smtp.remote-ip=74.125.225.134
Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4158606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4158606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=og6oGJ2c
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a1bc9520fdso4302735e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873055; x=1794477855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6K/EJIaKNDpKrT66k3dAHcz6atQzk5eNVtqmjjP5P6A=;
        b=og6oGJ2ch0nGsadC1gEvAGNvv+DZe1wcBZqAgJd1maeeYCDXa7FtSZQqtG6BA0rFxM
         GzeS12LR+Si2l+Cb79QPQ+7TneQVKv887lnkEaNN0hwowrdqoq/yMaSkdex6rO8XrQEJ
         dYLiBKxQJtS1ij3r7FpkKE+jwxgZ1T7vB7Zqpwq3d8tnIDJeRlQ531jGfaE7gM87qSkv
         SE1jjOj8U6CqjS2ffIM2DT5cez0HnN2eZeA+yawSRSEYU0Vwv0q99vWlhPDCxZr6C/tF
         x/8PXJsmyJ5qcIcPoyA7GqdGIMQO1Bu+dygezhb0nSEyjZV6H8z7GFOHr3XslHJl3yVT
         ptOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873055; x=1794477855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6K/EJIaKNDpKrT66k3dAHcz6atQzk5eNVtqmjjP5P6A=;
        b=GuKJW8ovSYzlrF2hZD2nbbY8AjCrLSgC+P7jxgVcWN2T7KO+cYNh/n8PWzMfAxlUX0
         0funQVVpLnkEM+xo4bTn0YifsOn9T2alzNfIJFBvG7BWZYx5dBrn1NxAB9TZo9HidTGy
         p48wFUILCY9AiHKTzXttjtLnC/6scxeOogL1MZitwGRbDnQW+wYp7oq7lGgbwQP7ME4E
         ZQuycGXugFBhwbNQFjoGmuBWg/VwjZcBa5SYYvlHPsfWVmFHFmfjXv7VE0WFb5MOpQLD
         DE8e6A/0xnUQRUp7fEB4GSaIVpEYWH7Ar+lbBlIYi96P1S4/C2ihrhnGvZUEvc9b8eLS
         /6PA==
X-Forwarded-Encrypted: i=1; AKwUvBwsiodVuyQZDNTrYxqSqYE/IEFnwfEZjlsiR/jUe1IDQAE0LMgHMG2QB5aGbnEwmGyQ/InBgNCraxJvR+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LwW1240GhHa/qc/pEcaRcPst2s/tuplFqxiq93XgLGQi8r2Xo
	NLnGvMDUnKCX6ZGxAKkXLQGjePiDuf7BfwnlgXXQ7Zc75cwYvr21w5Ko
X-Gm-Gg: AYBFou3c4inBDuD5LwVxXGHbkj8EuScIcgkbpf3ddojYewlZUQujlVnaqb271YZPaJH
	B3fbNN4++nizTvZjnFEhaOoqPIRUN/mHd3JFDQ9L3JcMVG5SSDcftgFwOFsqtNPieXiKp6cGpiz
	PtvSAPBcyMIe8hLhyH4Pru/gILdVhu9MtXnxO6fHYhENgIjVJRartqwW//HtLDB/8IjY4y7B4YJ
	4WthgQye15Ce9YYzteZDdrtAQnKpBjJ7U0hzfuRZKwZ9b2caQCO62QsF1UxQfayG0OD6YG4Fmpn
	24EqRytJbWGOQewDSq7hwgg2lTqI5f8tYTNBPM7NSW46vB0W/Cgn/xp20eQsdX+Pa4nxkBrvVN5
	5GrocOEza+9r7xq0mcDec9eRjn6oCUCYsON7xw1qzSIE//QU59gpi0JDrAaTVj7UhZMwXLjIuk+
	ycY62U9g6bhO+Tle0ssnA3A4kdpMPhLF34cuqUgpqZHuqyQMRSLwRwZDPZQamlHHWDvp9F2evYk
	85RaV/5tPyCv3i5EouVWBPzHkvigZbsMCOhthMRXeCfSQk70FBErCUdSvk2SIVPiMJZyjc5euZv
	HwhHoJt7mkC0IFndO4+E8AYloZI=
X-Received: by 2002:a05:600c:a4e:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4ac183d1edamr409274975e9.26.1793873055001;
        Thu, 05 Nov 2026 02:04:15 -0800 (PST)
Received: from 3mk ([50.60.229.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm9674284f8f.51.2026.11.05.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:04:14 -0800 (PST)
From: abu mohammed saleh <foroncewillbeproud@gmail.com>
To: abbotti@mev.co.uk
Cc: foroncewillbeproud@gmail.com,
	hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	syzbot+acd959f649966559199c@syzkaller.appspotmail.com
Subject: Re: [PATCH] comedi: give each device's mutex its own lockdep class
Date: Thu,  5 Nov 2026 13:03:47 +0300
Message-ID: <20261105100347.33145-1-foroncewillbeproud@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b54ad21f-68bc-485a-b0bd-8470deacca36@mev.co.uk>
References: <b54ad21f-68bc-485a-b0bd-8470deacca36@mev.co.uk>
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

hi lan abbot, i reposted it and CCed greg-kroah 
thanks for the fast review, also wish me luck i have a lot of exams coming up!!!

hope you have a nice bye,
abu mohammed saleh
