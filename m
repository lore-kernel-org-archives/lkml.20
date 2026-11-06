Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965068;
	b=FoQG9i4V+kjm/vfRAbPGa3nVXdU274jvCgUyF8Mjg5O/nAiD6+dad1OLs6x3RZbBCGtw
	 7sw2KW6Sn/1CIJoj11vk9f0CGY8aIkB2uehA5noT54u9UQuzNbGxXadSkgmWDi5u5QSln
	 OPqduXuKdZl5Vc02e9vt/0Ru1o+BIyvsQTNDBCWnAIR8FuvaMDGEfkUw4acAamZ6S2f1A
	 NJrIhnbs9MeveawzuFeeFyclbLiPY8RlGz01FFHlOHp4o77+6AIc8KdWoAgJ5amvkZB9Y
	 jM5ioUUK1KYy++t1Geu4pSR+opj93BKXO/lcRIbXbiu7pkAfEr+fVZw/j8sUGSaV3jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nk/cwVUI+HhtrpE9+By8yGGW1zgCdHKuqXC1z6SrQpw=;
	b=yh6GCEbqKegTYzuITZjhNIzY6n1L4bUF77E/LTqMuq4n6fRRJvRlJUn70F9IRBwA7qTP
	 ZzT1E9m0dX/Kh8zXZAnuEHASaX/kw4irT9rm5Ve5BifAhP23VnL/l8FPtb/DyuqDUny7j
	 87A+cBEY7QO3RuPyFbCCbgqNuEGmFz0VXUQlOIcOOZdfvGeD9SNrxjGDqlbe9vc5+Dxhp
	 KzaVEfG6U3+L6BPOgRrZkEbX5eb5Tp2aZPw82fkYOLv4ee6VrVtk/jVMdNVDnbVL71Xxv
	 ZhZf5B53867OdJad/lCnxAnkHzyO4EWvMKv8aHmIgp3L9sn5+0GnbDMWa5cWtt1TMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE921606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE921606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so735062c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793965067; x=1794569867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nk/cwVUI+HhtrpE9+By8yGGW1zgCdHKuqXC1z6SrQpw=;
        b=e0rnDNCCP/vEzSNMrsvM7E2F7XnN79sZ4lA7f2scoMSld3YqrX2kvu7bGUzammNRwk
         FZ2qB79S8KuD5vM3UVIrU6cd+wdYWfzLE+/ealF8EMr6U1Lw/X3ebsPL4vQOmuvFObpC
         9hxf3QdT6lK59b4jvXcEa+KdEi7CkXag2rYcLs6dwhebdkdII+xVQN/yXq2EHh9dAUja
         Ll/iHDCa5c5E91jsTTV6OGcI8ziKHFmMHDlrIjp4CjLFur6OvmR8kgkdNeuRScRxa3Wr
         NLF9FjDs4hp68IdIdH0/PD61Emgy8bhx5wosAPos6d4snA2+2aB7w0Lkp3psUMeMIU7o
         y6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965067; x=1794569867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nk/cwVUI+HhtrpE9+By8yGGW1zgCdHKuqXC1z6SrQpw=;
        b=yDuiaV8MfCMTB10IuTEHaCpuj4BlI6f1rT857kt8NcR3Ar1JemF4TJ+4Qerze7lfAK
         A38UbJOSR5jgWygBuNXwO2xTloNNshATk2x/2B/ziGZxq6/7r1/K5TFXAPkJeeq0fNiq
         MDOfKWdwpt/xxSZ6p+vQHGJIcB7NvRdaqADro7vhY4gp4J2ZK1MENmMdB8E2sNim03v4
         2tK7RN0qjt5MNq+z8x0snhbcsLW8QD4RxHJduYF+JQbOdbpHHs6sBKq3M7direHyMkBI
         8ltnYJtzBK8yq2VvfzaEASsM4JuhoAxJAaJ5YInITaY8JGRU+LS+DTS/ES1HRou8hLHI
         PNTA==
X-Forwarded-Encrypted: i=1; AKwUvBwY9VGJT9AhZjJPcyd3y+S4ZJjmx4rlJ6MthuQZ0ajdfru7rXNOWXkzGTXNcVPjavU9I7BTyuAffrvxTmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xSxOX6q1fWqztGwTvn3EzmMFDUBXgfc7Jy017mSeF3Z9TpPQV
	5Gike72goiUvLuFaE6UbJJw2DB7YMKJ8shQZYAwRTUdqkvNLIxZoKvzfLjVZIsqL6gM=
X-Gm-Gg: AYBFou23r4moA81MeDAqZaeodxgRoO0d6kfTyoUJlNhF4XB6PhqrOobtb89FbjWxL9q
	rRO1P3gi+lHbv/2qtFDpogKiYNyWYG+ts/BIWZGMpEAJYNlWJPK3+SnqhSWDUc0kYUOV4O4K4LP
	qIDrbMrvdGORN0HmC9YuC5eSPraDD7G127TfT6yanSMHFbTnXx8UjsiY2cU8TAlkfg3vfK0CW4p
	/WNgKrnt5QmYOmxsdhm1V6VSB2fE2ghuf2Yo2cRMO6rrf8MWrQg21C0pQ+Gyyt6nmiCpZUBNpH0
	AAQxy9SVa/horaVIBFR6ixKvqt1Lf2kMfPkM3FelLn4G2ZDmqWIl23+i+K7+KxOENlPTFMjl3Tc
	PYbg7XSrsjGgy/j0fLr1SWEV79TQNrZqi4xmKNuIxvU5Bp4z2+1pf9p+cCx3/+IuVEQmKMcrijP
	IxQ+h22i2/q0cjpavnruNS6Ul11COq249UwDZhxJpXaIeHhTeYwpYgYs7Eo3R7tCAmqguohtdxE
	HMrbf1qArN3KIXfIf0Igwp/OkM7+l+inK+24z3M9b0AAXBK2dNFhQPt7vA4yyWqfmfTTKr1YeR8
	fzFgiPAnNbbvVGnlylezBQVAjEyjrJJ3PKwWOZmtB00i3zhY2dxTu4G5oSHK5+ig3bXAuL5QhDp
	UskMQIYW4P1QnqoZy1em48dVhYE0i44y8+yipSA==
X-Received: by 2002:a05:7022:7f04:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b25d3650f3mr2994163c88.39.1793965066505;
        Fri, 06 Nov 2026 03:37:46 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:7bac:856c:1494:b5cd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e261962sm8107687c88.0.2026.11.06.03.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:37:46 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-rdma@vger.kernel.org
Cc: target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] IB/isert: fix the device removal use-after-free
Date: Fri,  6 Nov 2026 20:37:38 +0900
Message-ID: <20261106113738.2063585-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104142043.GG478286@unreal>
References: <20261104142043.GG478286@unreal>
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

Hi Leon,

Sorry for the flood of versions. I should have waited for review instead
of reposting every time the bot flagged something. I'll stop here and
won't send another version unless someone asks for one.

For what it's worth, each version was tested on soft-RoCE with KASAN,
racing device removal against connect, login and teardown. I don't have
iSER hardware, so none of it has run on a real HCA.

If it helps, I can send 1/6 and 2/6 on their own, without the stable
tag, and leave the rest until someone can test it on hardware. If you'd
rather drop the series, that's fine too.

Best regards,
Yehyeong Lee
