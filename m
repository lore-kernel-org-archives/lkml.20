Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052785;
	b=De+ZYZjmqR6qvTlB1IS+nDPh5LpZBcaw4Lz/SMtoMt+IDB8YN/oRVQJabF2eR8UgTZun
	 BaTEnzOoKkKthQ25ljSEpss7QVrsCNTGgvJIHjlXSZMi5YjuGrTRNxdf9HE3Ma+1B0OsR
	 tmdRjhmqot5FeENPHAMMOWDbrJH3OA9JB/eWyoMVluiqCBsfFzXU0hUF9fwtl+rnaCNTK
	 nL/81Z41gY92kIe+9nvv4UWUYyUEdbAZ7hBuB5HZGfWAVmGKxJFOX3PPZXyDuByE0GGQH
	 Y71O6ftfVnM9ZivvdGAv/4E06eCFNAcRJKIVbwq0WVQSW2zIr97o5g0+Vo91jyWstNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=JwJ6dqQF9CEwHpMS4ak20vV6o4umM67T4x6IFGQDk+Xqg3VqbtBto+Aj2gI0m1Pvwk5l
	 nyPkA3296O5bqunzx1dwDy75gDVvgxHePGD/PkHVxP++/G0FNN3Yv9SF7ITBkefLxbwLI
	 BLjmHKmikxU1bbtY0ESuE7ULOA3l2HsAmkXcA2aNodbBSDp/fBeWX8kapj/oCwcfqyMCo
	 VIfKiqV/8PJVH0NN7uhr5sUp4p06AqGVlhAUk4GT1201Ot9LpprvmfYKv98LdBc/zAWDf
	 czb8lpYsl4s7qKmnl8CWdOsfLbZb3t/FWmNyrPqOx6BkARKldYea/FqcogudnBLogUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLwiEvTU;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58981606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58981606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLwiEvTU
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2454031eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052784; x=1794657584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=gLwiEvTU6LQNiCczEgb7ofrpKDseU4lpdDPT6FM0Axq/c+Z8/S6x1WMK7PSQ76506u
         a5tGzgdKpOGxoM3JJy6vrijKmOg8njGcasIZzi5pK9JDzPr/WNXcQtMY4nG5Gdb8XDQ/
         RcYvdd0MeMDCeMPmLoBOLV6vKw39bvfjYwqxPLP06eQYhtcxlmOMQ6hreJxH2ps6nGCr
         Ot3Its97LdXHbOWZqjclaePbB/aaONjoOH0gs/PdVllmQaumN8gsVUSgYJqBF8xYbYnP
         /+H8mr6kR8gP7noszUgIQ538IACbfmy/+wOfaAMVDufTbeLCs1W3u9exs7fIdxCX6kmJ
         WLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052784; x=1794657584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=lPBdiUko0pIUq8SmxqQBNyKUOyNrPBRT7ItdHV1E75jewLruZQag1vN3ofB0cc+l7A
         kO3qeydwSElBAalhQDlrb5/lAy/TSSBTEgD/laYKh+S1lWACrg0c+dFXFxBumaL8/QJu
         quaNYLWNNOHDljZR7IGfecER7Oe0Ac2f5rR2BtbxPKj+CzlwGCJsVJgErkqTZBqfUXzI
         eMX/eoqQxQF+F5ieLF6JSHIhqnzV0kuhXHkwDTGiSFbrUVZMhMRkUux7h7Wk+gfN9BGn
         PxnyQzDYaeMZ/4u66QTTTwGWcfcn7UC3LVGItVkcL9a44YAqcMapZBa8oAVLp9EUNHKh
         Mglg==
X-Gm-Message-State: APuU4Z+EqWqsvIPQaP7DQ3OfS1LdVoQWVe6BjluhfBrLfqLF+/ESziAD
	xRmvqLBXRPq7sHVWFunm/kUcWgCJleUfWLZUHgJjydn/Con6cdf6mz1u
X-Gm-Gg: AYBFou3bjaX3AlyjdaEAXDH7H+QY4IbDHyYs8aR+Uya2Q9GpAKFCinitWKrHpfXHuX/
	49VWuwL9lqOUzlRbGVbHLSSnY4N6y/2hyo8lZOakzXhQOELftCdYzJ8bElBR2bqkm3FYrKIl8Wr
	Zf37I8X4HOLNGOvm0P/9RnMib2VGPArh+V75xd1s8bhm5Na9cW7mAQjIZ0kYyz/VPgLxkDrtPzz
	xn9WY4aJuPvtRmPxQDaykpjNNS/+4q99edneA+95Suten7lzRoB1/dPEltr1GWS9Zs8KSy5iFRz
	QjtYrurBIU/S3eohffFhKQzGS2iqDW9SE2uy8G+7OhvdQ0igyLVps/HcpClppuc5AFE14BQcBGN
	jQ/6NitJqtI9WFDNKUuoqp4pJGTC98NAfhoWA8+bKbIqWw9e50T/F3C//hRb4gHOpxAKP17N41Q
	xhnfK9SwoPs902xpIneank/SD2xOReY/pHCeONlk7ga6qxlj5ZXzl6i0rjpzHCGIyDhv8rD2FNa
	wj56e9++xyEmcSgoJqtUiIELWbIXhHxOi4M4RNAurkpm6WVRR9pOXdOkPUG8vxjwrJhEYJ+R0Sb
	eih4VWQwnFZaN1NzGHvhLvqA3C9MUmqq/4QBwSadrLwLnevh4mvnlo1PuvvLp9Vca5F6EELA4y4
	=
X-Received: by 2002:a05:7301:4145:b0:36e:20ee:b297 with SMTP id 5a478bee46e88-36f752549f1mr7137941eec.6.1794052784325;
        Sat, 07 Nov 2026 03:59:44 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44500sm16111604eec.5.2026.11.07.03.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:59:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Sat,  7 Nov 2026 11:59:23 +0000
Message-ID: <20261107115923.2841-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87eccxyplk.wl-tiwai@suse.de>
References: <87eccxyplk.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
