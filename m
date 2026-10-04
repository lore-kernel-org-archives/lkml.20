Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B63BED66
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135208; cv=none; b=qEdKxCm/tG/YT3candn74OfLWbWbLWzyTNbc9d2EP3Z3hOTL+irMnUcN64b17LG4S9hrlf6RfuP97ZPkEEdDQk8vwctuvtEwUDYfLfSYmqDyR7gr1ng5a2wliFvAIkP2chUhMdBx42JbmQudnouIkvRHj1JZ+5lytwlMPjLnS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135208; c=relaxed/simple;
	bh=eCJ/xgGOZpf3QBfsJ28uBGeOBNwffgZsfhRIp63slgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyHIUMOzbtqmCxymQxyX7/jXJ6wHC7pAL1ak+Q/C/TuUA/ssTIcBBx00xfrwNOMZxBjTF1vw1QB+pDg+XNwBPHLx47jrDWtlKn3HEXb7IIba/MAfZdhriwdgCsSiG9nUBTnHqcCM4a/KbRhYpAVSKm2pcEEXy8bYjZ3y266uhgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnFurfGL; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnFurfGL"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510b42f4e3so1013313eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791135206; x=1791740006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCJ/xgGOZpf3QBfsJ28uBGeOBNwffgZsfhRIp63slgw=;
        b=MnFurfGLZdm1wwOVkmkg+BTyflG0y6kD4pqWYCy8ExSjhsnevDG/6gW6w3RDYrG8JJ
         4Y0NYFiwCW+/jNePXjKKkDZ9KJkGEJugkQe22jg3SCdNouJxL9SMnlQ+kt/so+9cMnpv
         /LRW5DUEEh8bCPwnAYjBlTrSIXLQK+MDSchNl6kV/IjZEAAQsO3t+T9MQ9Oc8o5qfXiz
         6DHYJWMwCDBWv7/dFe0kyecclvQAPQVTRhuxu6Dd5+1Tx6ZvsCYKuHpbw0ZpI0AWJ3Bu
         JGVbnCpfSXREfWoRtLXD7hhkcX+WEJIo+1X76K5XYLx50nALyPV0pvXeHdyB77akztnT
         EBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135206; x=1791740006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCJ/xgGOZpf3QBfsJ28uBGeOBNwffgZsfhRIp63slgw=;
        b=fAPyIA27BtN4Mgo3+aSgsqfE58dlfHcOevtkwXp+6N5zreIm4d3HRsGjYvCPmwuc0V
         jSNAKmzezqb9QjD3V8J2XadX+1URbx0tJs6I3bE48fbTqJE4xJcjspMQItlPEJtJT07Y
         U0+ouQy0XjlB7M2eSAaIG/Z+ypWFObgShXh141YlKlJC1Zcjq3ey35iquShmuzKanF96
         6u9VMA944aH962PMtZdTOQmvlLijyuwXNAIIj+yeit2TtpZflDRq+NqIkSfmyqyLmTKW
         xt7SUAighUz/I70aYjEibCutP+oYgVq/EkOWNAkH99OWYkJd0aXhv7m8GX/Ut1kQpzl9
         MkZg==
X-Forwarded-Encrypted: i=1; AKwUvBy5Fui8AtIk8JzQdoAtmgkgtJVJM7yuZcWmLhgW74BD3sn0j1YQR+/AfRZe4Oc5vTyXPgyrru8P+cv+DDY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUhQ9Vxq34sMu7XD1JeODwdwRovlU38DEY2IE2N22wFQyYbYDG
	T2ONik5lVkNw0r/s6bUMN2CUY6vxaLA7d/UuUiDXtwdBmA5SlVfTBDSRf9AV2rxI
X-Gm-Gg: AYBFou0lV+BO0CfMn/D1XwY2sIdq4w9wT6KCyHw5suG9+Wdevgw/Ze8QiKeq34QdBMB
	AqAVKpNuC18YmpszKkqOpdGQgCZ/wupLQEX1ORTmsH7SiVoLnFFwlKNwUCvfudJ71wcfGC7rLZJ
	X45Zfr5oISfJM7DstboDUogpdJDm3j48BLIt/eQKf5q230dX9kQx2ktFI8h9frJQkT7kdoVG1rj
	x6hz4uFy/JM6lWOwP28IkWcBLlZlbusntdsQmSNyOXkloaJTjmPq4Z7iGwd+UoAJgbwvw323tpo
	IdZiMB9EjCoR1eZatdYrjn0ytzDKoKfJtZ3bW3J0B8o4qzahEGBvFzQkUHjpFpcv5ASWShJdSei
	xrh+hCdZtNRx100b+/aor35SX0tN/A/q0TmObUFMYXkG4pn9m47GcvL78xQq4k6RBS/8y2j3d8c
	7PKK+Tps8cNrm5llDSOE929btoN43Bs1inp0JGDMzM0D5zAflgb1/b8eTWk7KreXOeOg4GLsF/N
	4rcKFi1sNouexTQgEW/Mw==
X-Received: by 2002:a05:7301:786:b0:351:3106:4a33 with SMTP id 5a478bee46e88-35131065510mr305442eec.10.1791135206515;
        Sun, 04 Oct 2026 10:33:26 -0700 (PDT)
Received: from umang-Inspiron-3501 ([2401:4900:1f3b:8187:3c41:9181:ca6a:23ec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm6966533eec.4.2026.10.04.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:33:26 -0700 (PDT)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Date: Sun,  4 Oct 2026 23:02:23 +0530
Message-ID: <20261004173224.33809-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179087539624.434549.6585301310404315341@kernel.org>
References: <179087539624.434549.6585301310404315341@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 01, 2026 at 05:23:16PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Can this break a read-modify-write of TUNGETIFF and TUNSETIFF on a
> detached queue?

Yes. tap accepts TUNSETIFF on a bound fd and tun does not, so only tap
has this round trip. v2 will ignore IFF_DETACH_QUEUE in TUNSETIFF.

> [Severity: Low]
> If it is meant as feature parity for net-next, could the commit message
> say so instead of calling it a bug?

It is meant as parity with tun for net-next. v2 will say so.

pw-bot: cr
