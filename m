Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D63A5E7A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770402; cv=none; b=emXdYPMXpLL/0PC+bVB5e7oQ0lXdF5uQdIQIzCWwGfoqqYCitJr5Kt/TdmFht00b7K5zgJL8ml03Q/AehiUnxKkqPFr4N9JyVDDXiZjuLi9lH34XacejymB48wnBCnSYwuKGEZ4hrrsAuA5zwDyrWUTds6zX4hRmYTcq08sNxs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770402; c=relaxed/simple;
	bh=ssQhHGeC9tO3RO4j2WTE7N98K72AmrjyZhQkNSQGoI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NO1hQ/DKdbFgQ51ztVY690GuC30sgnjbcljxGqSgG22WIrMCIGW42Voqvu0S92TJ3N1RXB1atMsnelBBuEkfdM6TOS+CYAhDoTIIXvimM5QI9uTjUa4Bw06gAyB8yaDSlE0TcrnC0YPifNZiY2WxUnaMeZlX6tvXIrAbMg+Mpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMsrOhDS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t4mTscP3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMsrOhDS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t4mTscP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bn3UAw1E3oH/r+kr+1llJ5QZAu1AtSHSGUOeakcpKao=;
	b=TMsrOhDSfUbQ+3wi1LJScQinO3KAgmzzDkBwN1N/6Dz5VEI+6NAJLwppllmYbzSr8xtHgD
	Gedvh0K3Ei9Jkl3oucC7B4SAEmsDhsl8ZAn5V05I2/JdDHO8M6DJ/qHIfYTgoiOpEzS3Yw
	MmEiH2XWSS+HThSgSKiBn8Gja49xnjo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-M-DEeA2jOt6Gwulep20yWA-1; Fri, 18 Sep 2026 18:26:36 -0400
X-MC-Unique: M-DEeA2jOt6Gwulep20yWA-1
X-Mimecast-MFC-AGG-ID: M-DEeA2jOt6Gwulep20yWA_1789770396
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so305465885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770396; x=1790375196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn3UAw1E3oH/r+kr+1llJ5QZAu1AtSHSGUOeakcpKao=;
        b=t4mTscP3MdbQc743JPLjriXYCCyKD0sIiSgpRQB3J5HYpqBKV5qokvUYW2LrvuYpOu
         YhIjr3gnNKByV96Ujmv1cBMWahBmU5Z06peU7C9o/6KMzBZnCYolrPvy4r8kec61N5td
         OWOBCbxWqKrF3y/Lfs0ydlAEvgKdANTkbYmmMQ8Yic8ybQ+RQduvzvOKD0Gx6hZ0Dasy
         P0sWEShKZIOV2QAm4qDO0B59XO1VYTumiGQebgUN0eY0vt4MCTtQNamAvK/NKhQkp8rE
         BnaYwWMz3itFVuGZbJVKc0jOBbQWirKExIym9UM/QemFHZQMInqRCwrYfFenBWisdaxF
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770396; x=1790375196;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn3UAw1E3oH/r+kr+1llJ5QZAu1AtSHSGUOeakcpKao=;
        b=KslCAkO25bYnxX/32mepq7pvA7LbPePJKLB4rgZl0EyBZH7G0xIHM7IjS6GlP68Quw
         NipS8yPlyZe/7KNKxx4DVyIA3voXSfnJB15c4U2UJ0DijVdeCd6JpHfSmeYFPGnCGhdh
         8E6Ci/Enxje0ZOlo+MPG3QuSolYUO1nGz2PGNRXtqfO6Imu2J2TwvHE3h3WADpfHPue4
         Gk1q9dwCP07x4s2uVg0CTq+k8UpgSlT6ubXftAeyIuHw0e3DNU1UCUDNXaDedlxYuE53
         7mJOXWhTdfyiEupGmLb2F9D/q7+m1tF2Amu9SxCk2Bm0joaSsueo9qqvHbRxQGEW3BKE
         Jgag==
X-Forwarded-Encrypted: i=1; AKwUvByTb7EQp97TLDtQhtEtjsqODc6kEs+4dasLq3IhZLXEyB4CslSj/3pamqCsbspOBhUWuoPjJofWnFOq7ik=@vger.kernel.org
X-Gm-Message-State: AFuF++l5LXLnASqOj4h/1CIVvFJp2Sk96pIWhO2vnlaQIcSqBgFd6zls
	wEm7D4dKQ98S0qQ0gbg2FtVU55wS03e+6uFzFLdh34abDpXwoZnJXmPca9SO2OAao5djkaL7Io2
	aCG6o1b9DwFM2GuIXUE/73uZdnQVIeI42AOQSng+/ywoJLjUuK3T+oSACh9SJSfjAlw==
X-Gm-Gg: AYBFou2Vn9YwIHfDOpF9hJ3vRlX62r1meEtX8D2lbaM8OUwrIIuIKq0GoDVmF1Oc4Cz
	0Kq7ZgEOgydOsJelnYKqr9Os2JRGPHaKu61Ntdd/HkaNbeLfrwuE3A14BVyH7iOhZggYk4oFOU6
	hEjXRVTsxP3tX0LaISn1ceZ4p8RJHCPIZ27PNX0vo5OSmkYp4DyC+zRfzcmy67Xo0PDnDnb45zE
	omYhJdflZeLCPFhX1TNAMlY4h71Nag7VOad5U9srhIC/7ITdY6ZR/iQufLtk3GFXlqUKJaiBEnz
	D9j1kXz6zsWDv4/MQ2tV3d6XXTPyqlnFzXw0HjoE1w9G9cm5qu+ohTuwelu/h6AuBPPaf3wQ25V
	A1g==
X-Received: by 2002:a05:620a:170e:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93bdc6c776amr655938485a.29.1789770395929;
        Fri, 18 Sep 2026 15:26:35 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93bdc6c776amr655934985a.29.1789770395469;
        Fri, 18 Sep 2026 15:26:35 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaaf901sm51382785a.21.2026.09.18.15.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:26:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260512010938.41114-1-rosenp@gmail.com>
References: <20260512010938.41114-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: pistachio: Use flexible array for clock table
Message-Id: <178977034219.517928.11236545995612517796.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:25:42 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cWdJUy9XmOXzAOt8v0t0kJx78gmFNwn7dBPQ13b3708=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7poR1XGszqF45cf5/2Yf/mTffGsW03P9mQedS6+yv
 nzNfX/FmY5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAm4l7N8Fd27ZWgJ7Hz1pq+
 CXOY1FS1Nu7ENClxy5dSa577791W7CnOyNB1pZn1IctZM6lbfzxEX92d/vXsa1+V2j3PJ/Ef/Tq
 zOJsLAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 11 May 2026 18:09:38 -0700, Rosen Penev wrote:
> clk: pistachio: Use flexible array for clock table

Applied, thanks!

[1/1] clk: pistachio: Use flexible array for clock table
      commit: d27364c5db4f507cd9f3e7fb77c472fd69207256

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

