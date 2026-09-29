Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C753B346
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693943; cv=none; b=Qz6t9nEk0LkGR4DMvxXDvBzr3mgJOHsLhM3+jjB/JAWyuj6KBE8zS4Zr+QezWxTRxbD5v1a3IC929guxmi8n5qZwQcxHkLqiun25+yNqkt3HuJXXdmFC19FU0oaPvGWlM5bxe/khc3M9u7A87stzdATDyNqnW79ob3X263BH7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693943; c=relaxed/simple;
	bh=sqsXRXBdLNOFLMGFCpfBJMfaeUhKZCBs8CXGJ9Dd9Aw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bWzerz4zuR+AR7LFMnfXCTDwfdhypN/8Qf+Q9tCM3+wcFa5kOYXkQlRG4yEC+bHXZ6nkl7GvVev9uUi3Wz7bC3qQsMdvD9Cx5EB45+kOeNVGoEVVJCeVatdK9TKzabS5CjwwTCOcTTScxj531hTk/vybPLB2RjNB+tjpdllfQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOITVMBD; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOITVMBD"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f7a9afe43so3665853d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790693915; x=1791298715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kY3drwzw6mde/wQR+dfP8Cul+pAstPntnmIstXJS9hI=;
        b=iOITVMBDzICf0QoDgjl0qcEZsNDpnFk1QY+Bl5r+wT4a+IuDvT0szmmMv2YaKFVH9N
         PqP9dRT/l4QmC5MPCTBcHyU5sSYEYOM+GIRu5Ney6Seg96A4q+9yFBrFdI4Fre1kmhJJ
         2d/g+kPKsrfmD2y8itPcqypBFBimPKYR1QXLlnNe5yBF0vMe/o3nS+UuP4Wpdy2wa5Ii
         unVHb5HfCraTrK3BBBAWfN5OkQeOLy5qLAjKO3F3QToJ0dW5KjfBNXCQfhIBXxTJ/UyE
         CoV+ycBEPqCFPoPgpKcjatgI84zOr1tUfWfbwTGqXr5oCoiD0O8ViB86RfnuVYcw6rgA
         MYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693915; x=1791298715;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kY3drwzw6mde/wQR+dfP8Cul+pAstPntnmIstXJS9hI=;
        b=tLItEOCEmpiiQ5mNtAeTxLRaYq6SEb6blAmA2naenLBSTE8TNwNBGojPlVylW2RIVV
         REX3XmQ6d6LHzvB++aY4drsB4k5Gked9rNTinfUG3bhkKUclDEtGfsjergaQDuQMEwrS
         +tk9IHZ5IpyWw69ezfXqRV+Swy1LhbRqZj0EYoddBmZZ0Yd04XhWyRDYx9GDPwBAQJZm
         S/PqsU7rcCl/xm2PHlKbtOQ/U6aPs8kUw++7wT+6SBpd7DRNlpdp513egBOJNTgs9Q4n
         nwBu14rvlAOEHwRBfI9ct35EMj5H0QuuaPa/PKOQONuAYRBvM4iFCRw/ObxKMbsFj4tr
         fqOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsscPZOdaCu/lVzYmtfMqq8HzhffTwPh0HK+yNcDG0RUvJkNG+ESQSO4fSnRrFzE2YQnrqsr8oKzGl9LY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvTdm5tTnShZay2BpuoibxaFwFa1QZ9AWzt+ADFKvmoPebcd4f
	TgBpe4J7ZTK6Pz8moym67yjSkT0Yp0/gNmYpM2beMaGP5anVPZ3UlE7q
X-Gm-Gg: AYBFou07l9R6I5tEZ5kiWvR6lY/oh1zQg3W78ui8VN1M23PpVfGRNlhGrTwHwwx3Emn
	EBMwW9hEtiOnX3FvrZXsps/cK+2UBGHKEzs86NxQmtAmpCdbM87vRSYF4m9A1S+CNmiyT+CC7Az
	qKKy0wicse8zaZJAqJ4HHcq3gKithhw14eYFnywvfitfTg0GS/42iRXcO2xd5VahkuUES/J6w8H
	MppDkTDyQZiauFIsMHx5o2x9SDM0PnC1gSDDNvM/lpTzFrTPkBmUsD/xZ53/tmMdhHs5mssWLHI
	sGKmhyHnJZulrFU5f5Z6yXyh7FUKsRGp1dmBcKe8pNJ3hZrwofJ1FGr4qMyboEn65nZstyzFbqz
	27P6eVR4RHlDmD/hWTEQgsVHEc/0CtI8emLIKEeLAGyCGRNE5+P57RGxEyxtidiH8sI63WlaVu+
	qj4X5qcUFlRzdqo547gEuDmlovkRc8NBAy6KnitwpE5XbGl85uzIxWw92qkzkyvPruokM6rtFPE
	gSVFidrZPsoKtz3OOLBP+izYuJrn4sfcJp7FCGfMTb0rS96AgnE
X-Received: by 2002:a05:690c:9c0f:b0:8a8:4cd6:b366 with SMTP id 00721157ae682-8a84cd6b68amr53737737b3.34.1790693915243;
        Tue, 29 Sep 2026 07:58:35 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860e5a5e9sm60240577b3.17.2026.09.29.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:58:34 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:58:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Quchaosheng <quchaosheng000406@163.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Quchaosheng <quchaosheng000406@163.com>
Message-ID: <willemdebruijn.kernel.19517152cbe21@gmail.com>
In-Reply-To: <20260929073648.2748099-1-quchaosheng000406@163.com>
References: <willemdebruijn.kernel.2d23ff6855a34@gmail.com>
 <20260929073648.2748099-1-quchaosheng000406@163.com>
Subject: Re: [PATCH v3 net] net/packet: guard the ll header push in
 packet_rcv_spkt()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Quchaosheng wrote:
> Agreed, this is not a fix for that change.  init_can_skb() is being fixed
> separately -- zjamg's patch, now 05/22 in Marc's tree.
> 
> packet_rcv_spkt() is the only ll header restore that d549699048b4 left
> without a dev_has_header() check, and SOCK_PACKET reaches it.  That is all
> this patch is.

Perfect. Thanks for verifying.

