Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069271;
	b=R8KX3zlNb/Uubfh7mb1zqhvAMI0H2ulFyTU1VkPX2duW4qfxSSCta7ZBjLIbBCaVy80+
	 70lwH4dbQJW8iMnWBfZxmUgrVY021sXnNR7HwFGAmvGMoEUH7THwSkOuq9UjdKZxHyPy1
	 vqR9ZSbVlW7R1q4NG1QUW4fpf546DNNAs8RFKOnmoFdEuUEbAglJkS3OlbRWAg5mT+oqC
	 9DH+vAAJlf5aWwkADHQUrqOWGyqiOpXPKpFMdSxjbvfr/j5UaVtSrn7N9yLD2zMeyns7U
	 l1fPK5ktEqjJi81Wzdz2PIW8uZZ2o2tDKXWNg0ZoQBWj7gEwMol0wRfBxYPmt42IBlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=lvDhK1lQBCnTBgCeDn8IE0UD8FXFRVaT+2qmolhhuoo=;
	b=4UUPh1n8abmh6yBbz1GjjJ+pTkUFlNECVNxRh3q6zq2y1YntYi1YCZ1+/A08da6EDLmP
	 NuKiSiAAd+zHDa/UfM18C+BNbVeq8BGHTiz7UwWn63iX5gjPj6ZYmHokpSdqaW8lxDxmQ
	 5U1P+urFMBrIWkyG1ItCiejFQzBIqHS3LKWoMhhvY/7awqcL7O6/JSaMujdD8ZX+62yWp
	 XqJH41T4M1Ox1HTsDp4WWvN+2R/h3/qNuKa4u/hSakVCAJek90kGBloKDdL5OsWHcqvc3
	 6xZ0wIa4E9lUKvB4m6cPqna/UjeManM4JqCGl+ieNzOLjCBjspUgKHr631IHB2dxA6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F845606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F845606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso707934a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069266; x=1793674066; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvDhK1lQBCnTBgCeDn8IE0UD8FXFRVaT+2qmolhhuoo=;
        b=ExcyeD3X/eASS+Lt56dL6RiK9ULFT3Pc5YgWeHYUVnK3/fxmU3LjuVBY5qTgq7Nvw1
         5AmuEADgEJ+/9hfGT5RCvUELhTrKvjgbL5QbdIpi0QElAaNOl+gXJxtL9+Av9cQKStdk
         HFUxpii0/WmmdMYFkCaaF/z6fdIE+/OGEM6CvjRXuOVZbt47YLk/fQGdZX5Lx5FxIZlr
         vDx92Syx+RaKIXdx0aZbxswckdlg4CgI7tvsMxfzJOw1v3dF9cfweP4nJm3wTgr2tWNK
         Kr4Z7qkUZOO3SaQ67nbMvxAQ2BKrTB77BvLsWHIDw4RjzHRtP/CMZ4Z+Hf3yCHtMwR1h
         4hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069266; x=1793674066;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvDhK1lQBCnTBgCeDn8IE0UD8FXFRVaT+2qmolhhuoo=;
        b=IsE9+Gkjg09rHGJu9uM3MUgnNdGk3WVTGqRfm+VqT0H2ZA1j4SGTAliXNb3Jj+2c9b
         00MH88iUChhJGy1TCeZZSgKkCx1a9F2kIagyyxDwVp5+uu0ZAenhwd9CubFQAF7dAAYb
         cZNA+llYT8fOHP5ZrsNOhL7q0Ew9Kw0EUSBEkHdNPlwd2DR7RqS3S+TsHvPgEOjE+Haw
         FKm1+HcuQuRGUDjFJtscO91yauWlAKXJddnBWLW3OhqResEQ03Psd+DGHYXaCP3vQyYO
         /3qh7AkNg3ufdImxweXe46R7a0mD2R0GHVS9ptaN6rCzpUYVoajXWc2PnhV9NiDnCiHC
         oepQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvusQhyAuJ1Socp7A77JJhC3wPpfxYEKaYWFMaXUmyGKOSpeJYs3KEOx5KyZTSCRdI2iy8nkw6veK2lco=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVIzzVEWNyYQTHchJaKPyFzXK4Ugt2c+XC+sQt65+GNvPVWufC
	YjpFmoz1gNBPZzONi0BjndoEPjAS6I4pive2MT5oQkYKwoGTCogLrq89
X-Gm-Gg: AYBFou0ZBp8GUNgZ3uMFhLwi2PqfRlcPJgLDjHxmq7ExFIFNDdNLzpBDj8jR5VdwYgH
	ZaGcFFAUOl8cbpCOVeXMlw/GPsT0wT+sfdeBhxUpsG6loS7BmxBS51YfwJa3VptHs28UczomR/R
	1QQ/aTV1zrD+P1uRwII2bCdFRTGIUxI+loAV5+ErfIcHQXDLSeRwTjuRsJpIOxj9cgkfIN5kfsE
	qhi2mz+9trxzUeAHsjq7YfdaE3NOveXHm0AyFqy0H5gHy+n8vYg47v84lTXoltReoeQH59pTktv
	q6Em3pq92MUA6xn3BrvtcXL0XcezidqD/BnymTbzCFvRWICHefNDiUYIoWmsSHghkedq1qcbWUn
	5qCUmY+GjWVVNHH/a7kVqnyfH57TJdxtdeTqeddTqkW7n6PchoFF20hswfnZHuxY6ThVtreAHD/
	i6AkmCHdbYm0bRfe7oe2GT3pBilq8MKvRnqbHntvhm3FEF2okyNEuktnNmEhbb/NRDkvBqat1NW
	TBp/+qBLqWI4Baxi2da1ZUQZNP281lnOtLjX+Zeef95O62GisAxbZPOWhwUlM756NpTxBlJ3taM
	/IKY4dHBlw5ZF6RXKKxGTGElCMYxX6NHhuZBS58xbBRwtpmkLOPn
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr7922722a91.1.1793069265598;
        Mon, 26 Oct 2026 19:47:45 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm1518262a91.7.2026.10.26.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:47:45 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>, damon@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] Docs: damon: fix grammar and typos
In-Reply-To: <20261027004916.160854-1-sj@kernel.org>
References:
 <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
 <20261027004916.160854-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 13:46:00 +1100
Message-ID: <179306916017.2.12297411301652219760.damon-docs-footer-reply@gmail.com>

Hi SJ,

On Mon, 26 Oct 2026 17:49:15 -0700, SJ Park wrote:

> Are you intentionally removing those suffix, using 'git format-patch
> --no-signature' like feature?  If so, any reason to do so?

I was trying out my own script to assemble the patch emails this time,
and seemingly I forgot to add the Git version footer. Thx for 
reminding me that.

Thanks for applying the series,
Aveline Noir
