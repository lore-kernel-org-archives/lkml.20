Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A473806B6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791067028; cv=none; b=VB8XZSvOKygoPnCZUi+N5n2N0McK7A/YIGncyLPu8nLVhdCIKN3+JIc6SD4vUiikKlKHGgYst8f5/hfxw6JBLc2uTBM4NHXw4nWxahJNMqGpcQ/O66oiDZ9hgJwx0YbKq1roq7Gd1o26IstjxUY3FC64LsZDWODcp9UjGShXUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791067028; c=relaxed/simple;
	bh=gw+IpNQewdVI0rqRaqiRXyApfzC7YILLn9U3LasmatY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNB9IUf4pItHnk08ggusVKoyl2+uR5u8SXW742NE/QeZ1b8AfqlPAo+tgXeNu51zpI3ZI/Ln5BB5jxj6BveZLZbVfQQ1kAEmjaiwlanpIV36zig6D0zPVydhoO+Ys9Q/iN6L40FzAyTqfVjZRMSWcb1w/oTdUmqzgCd19yahuBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnZDRAb/; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnZDRAb/"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-15602439e3bso630c88.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791067026; x=1791671826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw+IpNQewdVI0rqRaqiRXyApfzC7YILLn9U3LasmatY=;
        b=mnZDRAb/grxX/XcfEiAhoSiaMxnzA8BU1Z6HwxHzxBQvm80Zjlp9fo2IeoJ0OXiyyo
         JsTCb5TgM1iksF1g/UD8q3DXFnAfDQiIS0DR8nyaDX4gPBC+utLubXtCUmK7gkk2C3g8
         7Qm0FyZwgHlo+wgnNbsFsOPa40+7S5CBIN+cCAaI+KjiNy1i+26iJyilQUvul9GeS0TG
         Z8fWuAlPmcdGjGA7FZFAZfAnqbVVwtMBwUw682KRezlpAToh9EqzbzGw+3vV3OmIL17U
         3Yoorcx18oXTos6AL0sBvYvPeb0eZmItr8RRVdt9FlaYi/7kYd+fXWGi9iTuZbjMQLKo
         pOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791067026; x=1791671826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gw+IpNQewdVI0rqRaqiRXyApfzC7YILLn9U3LasmatY=;
        b=S7mHT54tdd40rOWTucJ5mICfUYVHpU8EzZwJCp5/Bkup/I3DMUaicHl9i+DbqitNSm
         M2nW7UqmZDppcn/upV/J93QQSoMaHobJopcfQnuI5Xa9nogvp9w95HZrNpT6dFYT/2+b
         Sh5+w3jaVpK521+TyYnTkQNpqyuxfKVJhWG//z32CHX+oYLv2ae6K7u5tzSZuLP3AKOq
         qMt5Td0NaUrWIva8XrBtymCxMIUSYywLJ9xoSNpz2Gvhoj7GBMyRauzPxKMDi3Dqcmo6
         Pvk87LuPNnqdwu127CltGfa4234qSM3W+uyGVmYH1LRcmZWjXH++VgCtGrcHtzjEdEoT
         +INA==
X-Forwarded-Encrypted: i=1; AKwUvBwp3e6Id7Y+3r/28kRp9bvjEZEfkdltzWV3j19db3h4PHRn+YxStYJNzE50b/COFGUcxiXSSSzBpckWMnc=@vger.kernel.org
X-Gm-Message-State: AFuF++nAtOBN2JsLqvXxxG1/vSLeF+jltgwvV0/2HIjiMbSOkVVMIzDJ
	2PX6M54ETQE5/UGSydL2H+SJfKgBYY2+RUGVFn/OBDuib+hPeUM+knyT
X-Gm-Gg: AYBFou2rbrrUwVQAW4VktnqZiDpTTnoULYGwSLa4MyAWctuVswVzXbnaY+OT8opcqNY
	Wa9I9M45YdN5dEdkPFQPRG3BXRiOXe5tV8L8/EGaiuTneRZjMPO389goqfhVhcJkhCDb/EyE8NY
	BeViYB+oEV2KM5CrmgZlPLqvA9zQQDbFR6wG/CI+S0/3u66rM1gfVF7uQ9A+qW8kmCb16hMeTf5
	B+TuDulsBPL9W+LBi4gCYOyBhkibqXXziV6MnPL0er07gCPZ1qGa/Df0auFlgCbo8aabaBBL/76
	IVyPkpyNye+afhlAYqZyaLOIxMZAPyH6BQtzvQRcUZFGJ1FSa+0I6DsB5/RsGcIbZHSAWbAOIO3
	2YtuG8thu8b4Nskv78MUITcndcSvQZz6LrApm7P3LehukfNdGAhNfQhdbjXhKe6mauXTieJBdb4
	oJ3MJCcJzigoTs6ffDDZqfVnyD711scJguPBI7/Mkh/BhVp3l2wGp45RzILiZwum22SoHuRxkmQ
	hdo6tuQQYQ0tcKLj6Hrm2SOjSkByxNXTWXxEUfV9iD2uNvZOG5JXFvBdBlWOrHEiCW2VImfWSIq
	XXI7NHnkSZJe4EXEZGxotEI5Ly6n
X-Received: by 2002:a05:701b:2516:b0:144:ff51:2d73 with SMTP id a92af1059eb24-14f5b11e751mr11363335c88.2.1791067025496;
        Sat, 03 Oct 2026 15:37:05 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fca985c6sm12436321c88.10.2026.10.03.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:37:04 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: size the RX FIFO threshold to the queued transfer
Date: Sun,  4 Oct 2026 04:06:59 +0530
Message-ID: <20261003223659.13974-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260919232647.448748-1-navonjohnlukose@gmail.com>
References: <20260919232647.448748-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andi,

Patchwork has had this as Changes Requested since 2026-09-29, but I
don't see a request on the list. What should change?
