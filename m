Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603763;
	b=h4PyfuAi85iUw4I4tymaJUGNWeVV6XcCAcg/n4FZ0k2OSIwxH1BdfbuZmD80Sgmbjra2
	 m89oEGdbZ2w69O9UqQPajJHpZUXEbFQuVv7bG71GDENB6XEPPV2HhWE1z1VYf8XXpp+dj
	 A72d781avMy46DxoHFm0qFLGiVQo2ysnJw3emXiiAVxFlkaAzTkzT4Zavx190hCT7ZiWS
	 Xzr6Z9PNzDgHLOy1siCOuRdDZwonLX3OHY4P8FPOQS0xYvMBFHYaJlTRW9lsS3ZsPosJd
	 YhtRnRCtC2yxlgaVw7nNNJxUfVMpmSqoUHjl+YMTjBDMNy4lP//RJaXiB6s/m/w2RlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
	b=IFYP/bNyknuipB0zjfGWIuuBqJGsm+ma1Rs53DOdXT1Do0S52eXAVp7V0yuxAdUNsSjw
	 EsubaDFDBuhnfdRy6d0St28eOTQwdAeVRxcv5pNnNxkAdCxwvc2SWbt6MXEy5c+BPhOLt
	 GLTD82SSwLPJIpKZ4Dkir/+mq/jlTdWhk2itYtChFH5vuVTrD73ecu1p9MFiE9v7GpEEr
	 z55Qq0XyROkINfe8ONDHVifuQE44QyLFg7Ocz0KFqLnMv5TNWOByFPDX935Gqch07QMQD
	 8nd2LfNltt4Buwq0QSgAIHwaPTOPGEIJRUx1H9xLTx1oO5Kq19SJFva1sNjl7J13Vng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7805606A88A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7805606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso2434255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603760; x=1795208560; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=vhNWPkFDUTrf2CnKOWMgYdIWu2o0nTf/e4Pu1EMpPy+H20XWePJ5nudOwmGMKSlrpi
         xwuhBQVNPouq9VItlLs2XhVtJ7CE4XkjjcJ4GtkBi4O1eFX3JiW0DW1+HoQnoRIRLJiW
         dMlm7pVZR55ZO8iQmlKB50fDcuqZfHokMfUUZzY0TlI+h0gNLO1gLJV0goXZVzg3VtUN
         UYj1RXXhaxzNt5yibTMUm5pQ9xeI3uqvh09oQx7nEatKSJmSjwrEP7xhN/y3EVRWZCOj
         xiEW+tGGXSmWEtpk6kE0awccANgaaAs8Nfqf/Bz2U/Cv509PgCVebIBieyT/KMD53iYA
         GEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603760; x=1795208560;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=P0K+0und7M11Jk/cIkg+NCnO4xinMJ2lHvQk21/dijKcqnxYvvqAksjeIAlWvMzzKS
         hMDeICBFpKpdaLA5FTXWbnPT50uGJTbE9+HSboPiZfqmwiXQnaHEeVcPiRj5QOPc3dqG
         ZSECxXHv9nGUWYhlisONx13AaXaHaYc/qBkoMeV6LfkKDovKhrHQOf0jPFi+paKajlZp
         sQ2E5fe/cKZKH8FumPZDrrUpHjsqhFFGrf+x11NsXKN2u1In1shV5ZD9XDmkRwJTVtZq
         tQ958bpmb7X+NSIroTLRovVBrIUgHDOoEhTW1U0GvAFHjMsguXyjtbppXZ0xW4r9p7Tl
         /Caw==
X-Forwarded-Encrypted: i=1; AL+hErGtEVOcjVT0OlY/xsA3Y5qKb2/YOZeajZK8MctEvkp4o4Cv/xOrZd6yEAkmTq0Qc0/Mhx7AUToCwnIUyXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LGc+5wB/zxWvlkq0G1K6jRFuJLckwGJXkCXs11IJVqQtShu6f
	NY7DkanAkUKJiDBH2t5l4hHm4SeDNeLDNBbFVye8u6VxnSDHTeyCpT8R
X-Gm-Gg: AYBFou1ExESPT3F12RooeUhAXBI1od4ZNH6s2YuS32V3b/KL7LwEujBVltCyU5yvnTC
	rI2SqZ1G8H1BoEHzANFDMhEyWZZiNMoNj0nxOgjT78rYv9YRqfzkvYl60W2QGEjeFigC4WduOcw
	f+wptUz8FZ98fh9NSv8Rq29OOAlQXerrPCFYgbD0f0dYEfuFovJTl0zUgCjh/je14Bdd0tOvPYn
	lM6dIdh1VlpZWRWldmXdlEiFmwQ3AV2szNXBpCKh9yAzhR72ocS+nekjCw7jaf3hGQ65U3xMrxa
	YgQs2s0mCvzNChh+pkl5ZImVJJquzOxboFInl83AbAW+S+L/By5Peqbjd+V2tWejfrVtghozFUf
	uFp6v+8UMUQoOE6Mb1gtjxwYESgsk3+GA8/nnVcR06wrikeEXuyILR84XpGK0ddwuC3fkVf4XHB
	SbmhjWW6WvgnEB5EkF2WjOjH1F6LvIuP/87Y7Cfg2n5vNzMm840+2rD7gso/GhtYcnNUiTcIBw/
	GQXYOmvhpTU6lk1ABUcEmS4Q7KQl+Gtqk7LHmuQd7WlSzGlCpSCBiMNq5OdoziYCu65XKzg8g==
X-Received: by 2002:a05:600c:a318:b0:4bb:5f4a:db62 with SMTP id 5b1f17b1804b1-4bb5f4adc6dmr22065715e9.14.1794603760103;
        Fri, 13 Nov 2026 13:02:40 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:39 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <1ce6d7664e48413d9a5a8b11a986f746@gmail.com>
In-Reply-To: <0a29235e23b24698adc59fd117e0a222@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKHB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
