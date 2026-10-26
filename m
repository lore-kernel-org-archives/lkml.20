Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016312;
	b=N3URBMpH4/faXaz7ZJwByUT5mau0WIxpIWkrzT9QFS7i31aSV3IZpQcNfwj2TfLNCFWn
	 6zsmW6fM3Z/BCSPQVI7/G6sBPX7lpISL6ILHKz+5Paj1jdOHcax9yv0DJZHjMFmW+g/Zs
	 rKgL9cEkitnJ9cBq/LABpJAzNnrYEZbFX17use/rVfcQRrYGGPoKiAkm0wvuuKSebws7x
	 ItZ5Ha62IUGeQrUKcQoop6cIL52YBV9iHBW7uSSuDu3DDACpDXl7djWVYSq6hnCX8XICt
	 T7XScjbGunZLJt+2XqhUllUnLOS2FAiCOipJU7iPy/5DFYGi0ki9woP6W4Z8hdq2uhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	b=EO4tMaPYMRRAN9aaJOW8xRx6s1F2M0xNYvJbHCOyLKfzpOTVWYAB95zm+gyvti6s5rE0
	 5UpFdppuB8N+9FZUoRBjnXWkZUqjs6qtrHYx+mxvvnpfim32imkY2DYK/bbd66OnzNwTU
	 J4RBPPtiNWTmT+dKKBpAVmJVzPD+UKVHNLGuuNdmMwWST4Im5EkMnrbPO856v/e8PGvwq
	 UvowpN2VmRbhc0nwskVdLfmzqpF6uXlotAivQ16MEc60XOKUiIie2lGIXbBqYimw/EO9f
	 tDhvu0eEnqhiSj5al7xhimc4rQI7s8YeDxPYlO9YdTGnM0S/i5RqzRoeIRXBC3IWlzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pa1LxFo8;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9360606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9360606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pa1LxFo8
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so3672765a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016310; x=1793621110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=pa1LxFo8LLbeGCNxDQCA6yMPz8vUUidUSCsG8ouubhGD557BRVXPQx+BtmCYqwWNaa
         5mNaJOHrOryBT3Kz6KRBPllJhlM++cWnFbyQh31H2+8aE1ugsXfAN0Ie6gvp7T0lEF9y
         lyhTq402eES0sZuiOgaqR4QrDgZs225fl1LzE+a5t92fpqoryRPyjyZJTVb5EYH1HbTH
         P5B6H3jf9ERdt+oQ+3U7p/hgB7PU26BGOfsraAJ+fY8wleWeD8WowZEIIbJKoI2nwLQv
         k0RBvtotm6xgxiOvgnviQATpJrEMCVWUggu1k1qEdKkXY6YLSdCVZuKzObEoU+ek0JXM
         E30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016310; x=1793621110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=j6nxPtiwawqu9Trj6MSj/KNHY5R7HBVRudJ2fpLIllt7Pji3Kz5AVdYtIqMDLsGXAx
         V0k5lfNBAMRIMqGbI/ly8b+Mz0jCHWozT5DF5RZkyWe+V5F2PiFRiirf+fhGYhozgj6T
         VxtrwRw6W2H85Q0MS36Clx5JlI34kAxDQJ2hVt8dn/dNIGjAlRyl48Qed2gAJtsfOBJ7
         bNJEHltXtbUW+jyRAr5d+1h91WJ5VGXNEbYcfewlt7gT2LClqNX2HDcu+4hcR2oWQ2D4
         VOhJpSSpwzBB9jN7n7YST1v+tLuK9Ycvzf1haOe1QSzbjboPG1drfD0q1bxbEW9jOUG8
         F1Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxvj7w8S6LWEwozZxKcioawQv5qcei9Rvh6PSKa5vrRl9vlyQEeGlkcZnsjLW1HYtJ4ez+0fT+/CAglu2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAwvW2XjoHWho2QZGM0eHtywH4sK2+x+syioye3IBnQp4PI7Um
	pFfnwaFh6JG4uzwBg3DVbqrQhj5DEOzPMh1vzdpPYM759wN1R72hOjiv
X-Gm-Gg: AYBFou1HLgyYt7y6j+xrKyr44LZqjc4qU5NydlFQbitpxvrNzyaR5jxCdEXzD7Pz6yv
	RZPzvlOeN1rgZQYiY3iOCcJtogRZgx5DHfMXoJ/Q9UYJhuxNo/BxLgla/L5AhiRd5ClVWNrVmLq
	/5WGnkLDaIVwIV4yxWePPuvavHlMI6EGbM1xfxmm+QZ7uv2ueGduN46p5o4+JljhYiX7SXX7NIa
	YinZ4gI1xvUGO7iomcNvcCudi5DxtSu71lmR9EYIt0fn8Ewrf2rtQuf3hjGfXDG8mdx4GJMzI5X
	JWxP3vKxEwwgMmwpWGa9HmiOm4qL3WlR8OeNt87Mdtk8DzFWHRUct97YCPQgI/R5R7R9YirmwAd
	AWHFMWHQbCtouRS0HcVYiU+aAatzvqziWphg6YukHt3alXU1UJiOyZSdPB4lpNK2enZkJABkqWE
	6qaUFZsli7wY/2Jix+VRD+gReyMJZKGwf3HFIl8Wd0mRFdR0kfI7oCG2C1mv8WnegmT6b/MKpC7
	tjdX0VJo0OQa+Os+nkAmxi49Q5ttRWBu1lfGzFyIiCDL298EuQnXeIrsA9KFNIqr+saow==
X-Received: by 2002:a05:6402:4026:b0:6b4:1037:2b87 with SMTP id 4fb4d7f45d1cf-6b44300b84fmr8163749a12.31.1793016309713;
        Mon, 26 Oct 2026 05:05:09 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971383sm3453137a12.21.2026.10.26.05.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:05:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: f_ncm: do not notify from ncm_set_alt()
Date: Mon, 26 Oct 2026 09:04:52 -0300
Message-ID: <20261026120452.37013-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com> <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
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

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
