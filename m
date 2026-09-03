Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589C34EE85A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452805; cv=none; b=N4hantk09iQ/khYrz93Ac1FzvJ5LUNo0LpdtZMaV3aWhBcO5YEOkIYNnBQZ/50h/a/GsqCMBmN+dSgtS4nRmwis5dArbaPNp7n41DRa+dMtjbvsTvjMUqyyW+BzgTxDwZCO8EOqkEpEHdSKMOKOBiqZURJQ1SrHUryrT5wtHjPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452805; c=relaxed/simple;
	bh=kBJzSyEmLjLakSZnZLouxVwEm6diqgBCu9rGJL6ISg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5B2pyhYkVzqqM0sFfED3hoheJYCDtoyLJpvscZruFHMVYAQwLMTsAnxdBO/gSF1YK07qe88AiFRa8jfImaVbtPn/kZpgQ4sW4zNB8R9Jw/5O95bBZ4oSYdMf3XtEILspeYy/0XdH9pX+CmSY6VoQFyMjTm/L6Uzrx3Hi2eQHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc7f/p4y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc7f/p4y"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4994d41ceb9so59715e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452801; x=1789057601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsNoDHPNAuzZJbO+idLSbliILF62YDBTYT8M6gLpDM=;
        b=oc7f/p4ycYSeJZq/ApumBgE94t7ct3L0XjrCjVMppIHcm89knibG5pK0VWGDJ1a1WD
         MPshdCY++DaqNmWPA2EeizgXe4g+DGOeuTZovng2txpZbwNVtu0/sPkZjCr1c44wy5km
         dzuCR7U8+w87ioiFRromnGegYQZRFoLFTMA01loem4IGUh6RqI1UnhZ9+xl8P5f5i0jW
         nJ0AfUANKGm7tle/3Glct18N6uffOo03ZnIQG8SRsQFv4OVsVqn2kxOcg1WCyOGBMbwW
         a9xcAM9P+zKvYNNP0uk7kmalu/Z9lcmlXr6l/uUcbF4TIobO4n1TvEQU7Borev6drPAx
         LS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452801; x=1789057601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsNoDHPNAuzZJbO+idLSbliILF62YDBTYT8M6gLpDM=;
        b=NJbW/2mGTqf7zVqXHW2C7V2+8QlZA+SunaNS+Ms2qaUV2os5rovS3o4+qdiIqf7r8U
         WbFCPu/XJYQedVMU85Wc7DuoZ5HwkVVbdxM48tJevDfhBMF1tLkbnHi+pvCI6KFpG8DZ
         +wkAvEB4Q12Ajdyie9J5g7GIhbvzcN05j8kMQUZ8jHEqGm7dCFAtIV3+wq8/T/h3K9J6
         X0oFzBGsN7mx2B7CJZUMQBvijq+Xjqy9z+sZoYkk3hM6GSDXIYbT6BUk3AKnmseZ13K3
         FFEqPyYxarQnIABNsZfvlRwZSrIQA2SHadZSoEhbcUwUdd2dlVoE/g1NlsxINHOv5n7I
         12AA==
X-Forwarded-Encrypted: i=1; AKwUvBwRv6RbqcQB7ImhuYnSMUvP7DQhiXV883qYVOcBIT3hc7vWzhw+LXmeR1loC8eWVm4lwka0/pSuDWpmSQI=@vger.kernel.org
X-Gm-Message-State: AFuF++m7kPjD3sNxfo3JQJy1kRdpuw89tvmZ1KhojZ6QgqDx3lvo7O6P
	pJLnO3yP+uUJ77nQXpZZ0qaidffbYzL97oadkwPwVFcnwDeq9/eN77SD
X-Gm-Gg: AYBFou1f77IGIQcarPvJWYpOAgwp7UR+U14XEMculTfuyBULKv4vXeb/8PkRGyUKsky
	5RJLEdDV/ZjB7Rk+/xa4S4g27kme1pSEJ2jGLTxzKuchWKv58zz58Kic/4vZIhV41mBYwUs9GUS
	ADdG4lVUFjuuft/6+JVIlMZ6Hq40yGFx6xHDP8+qwAzC6AEe9nYIwblFBL5oWQTLUxuzKJziVca
	m0XtkUf+Q9wvhdI3AJ1xpf+qPEllufOABtqq/AeNZzn9PCJIAtNhG/RM29BuXYe+DowD7wjUbX8
	YxHYUioYI27dGMENRS2YhWAzCGe+oSzMpJPJVl5laG8z+4dh6GHErngSluCQ+YkE3AzbzzFBbkH
	E1eAv+/tkkb22T6Unk3cWwiXBCSnnIUMwpZT8t0GWkYlUHFFxUXGxKzLUxqENZMo+3fa817icgI
	ZzK/rRt5iAp30sa0ypsLUKjrbJEv8RkhkEZXfx9kBjv/A=
X-Received: by 2002:a05:600c:83c4:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49ce580365emr108669425e9.1.1788452800655;
        Thu, 03 Sep 2026 09:26:40 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:124b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2531232sm57273715e9.7.2026.09.03.09.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:26:39 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 03 Sep 2026 17:26:03 +0100
Subject: [PATCH net-next v4 4/7] netconsole: reject a target mixing IPv4
 and IPv6 addresses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-netcons_ipv6-v4-4-bdd183c844d3@gmail.com>
References: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
In-Reply-To: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The local_ip and remote_ip configfs attributes are written independently
and nothing stops a user from mixing ipv4 and ipv6. This leads to an
ipv4 address being zero-extended into an ipv6 header or an ipv6 address
being truncated to its first 4 bytes for an ipv4 header.

The command-line parser already refuses such a mismatch. This adds a
similar check when a dynamic target is being enabled.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 4af4f3039d4c..abcc8515ddd2 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -488,6 +488,12 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 		return -EDESTADDRREQ;
 	}
 
+	if (nt->local_ip.family != AF_UNSPEC &&
+	    nt->local_ip.family != nt->remote_ip.family) {
+		np_err(np, "local and remote IP address families differ, aborting\n");
+		return -EINVAL;
+	}
+
 	rtnl_lock();
 	if (np->dev_name[0])
 		ndev = __dev_get_by_name(net, np->dev_name);

-- 
2.55.0

