Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0684AD4C1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214608; cv=none; b=SGrrrWb0QJ4X7JtuY3h/XlXZ0IjUttNST6nfDQ4lfdrDeqUPaLv9evVnNRMYGCJ+fG24jvTrlAS/iDXCxzw+vZmPBaVl31iLw8hngb2S5VkEeFgnofW07pzJz+Ub9Xo8QC2bKe9npupDa9OfAN3HrsckCUmFuud3UmBIRLRXQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214608; c=relaxed/simple;
	bh=rjpL4llTsXpkQauEKSLeEbt4jKXhpoQ8xqnmJ38lg5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNv4i67ph8JnkB++R3ArWLiCiFTMW4WhRXWBX3kP3HjA6eEa4eZ8J4KWZvEhnH74fD+MjZCk6rsLfmb0y6IFPTsVb2A8CZgJlx/F4Yhpx1AQYBaIcBjZrp9YPZFHa/43bV4iM5qZaIkRb0OS2A0P0iGEpF2rwRhx4cEhy56BWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/QWJGba; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/QWJGba"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-886ce63c1c5so556038b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214606; x=1791819406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjpL4llTsXpkQauEKSLeEbt4jKXhpoQ8xqnmJ38lg5Y=;
        b=W/QWJGbaCvZicSiUvVgsntWJHBCVmPrS/XA7IBCapAD6EdPzzcFTc+tssuO9Z87Xn/
         a3m2e28svriSGJQPbEbbt8dGn6ikyFj7jjCvTpeuuOeRoy1CFHC1aB/k7szwdqY7/I3k
         +90hWu5keKNR7QYrqRbpmnkRMrYc2UnYj3UXLnBhGaNTkghczT8KvTOKSKtOoYsakMAX
         +xc3RgcSN5WTwRzWD99IAE8ewGebKxyUPoInx9VoMsN6JnqgJewXzRdqFCD7O7MJy5ax
         U8oieW24QcCZ3NTjVbDEr428b5w8tQKgXIJ9DsYm3q1Ec1hem+ctX0wDVMNwX6xjb6M7
         2Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214606; x=1791819406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjpL4llTsXpkQauEKSLeEbt4jKXhpoQ8xqnmJ38lg5Y=;
        b=nLTeg43guqZUAK5ZqoGOEWoEJv01irZN8Hlbjk8LYbuAXscWINLKW8IVH3oUnpyCqQ
         4cA2jo6GmvmW3+zmiar9luaZOJfPy2WCy/AI/LYJAfM/vvLlMFlFPtB2/+WyDiSLpJQN
         /WxuxFJ4h+U1c8pIM3XKe3mNp4ndKNoKpnnK41BmbuM4hSLVoUNkisCmWUhTlgBB5sN5
         vddGAJ/T9sdjPEiBNGVfx87wXqL0wJt69ME7R9GowzmVnxlLFf+0UBuGTAT4oxfd7f27
         vSDdxG55clY3sTi5JaMVuQ2e9FCF8h/Zg2t7f5u9sGN3kCxKQ3gFbQhBcn4BUrMKOQ12
         d3Dw==
X-Forwarded-Encrypted: i=1; AKwUvByDE11cRFax292cIQKe27Ai5rjW0OlWJY4usSpEwOJ4uFTemgviNf2OL0G9pLrSzTKpopIz6VEOE7//7RI=@vger.kernel.org
X-Gm-Message-State: AFuF++nSP4E9AfsBR7eHfkSYmNPyY4qXIND9S79Rr1Cd6gUAnBKh62Bo
	qYy0omVitkBocDvndVM2q4NQ3pvxofdyn9m7acooMPY6ljX44IhxYRaF
X-Gm-Gg: AYBFou0P/ACTiD7HQ8K/9by46o+WNQda6CbNqPfpe65CZwvdVWKzuOY0omJBhFTb0i+
	qEvrdZOwqFmok34oQ+Z2J0TrK6wGunKs8b4B7roNa2qMDH6OYUqIwf1Y1gVzh/PBesYQ3BsKMR8
	Ne0T3S4uf7VDtIPslH6ZFfcIMLoteZqlSDM6qaLBZgACbLJjPjfsJOJi200Cc813WBcifqVI9s3
	r9RrC15NL2lWraOWzam5SxMH85odB8bsEZPfRyqXvB8caktCtNgystGHaS+bVHEwFapGJ7KyZVu
	qgWaR0h6I8xgtiJUcJ5u5x5AQiBiA0n2ypyuqaZSGNepkaTn+X86Q/OgOqQ85iG9kZc0/fGFHq+
	NKqlkVf4eC7dyJkRXoT2Wf8J27I49fvynoD9vLwdiuO+VujThkfwV6KHqq2XQsCleQKh8mjs7ID
	9CZpAhsZqkV3lf2WSih085NafAeTYlND/J9r32pxq37wC61i9/hlL/0h4oTL5wkbqVqPo/fFQN8
	NzIJNKgo36vWT5lziqLKOZnGaer
X-Received: by 2002:a05:6a00:f87:b0:874:705d:f652 with SMTP id d2e1a72fcca58-88af6e19923mr9775863b3a.32.1791214605735;
        Mon, 05 Oct 2026 08:36:45 -0700 (PDT)
Received: from localhost.localdomain ([119.14.238.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88d62aaf2f8sm1966099b3a.10.2026.10.05.08.36.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 08:36:45 -0700 (PDT)
From: Wayne Ho <wayneho219@gmail.com>
To: griffin@kroah.com
Cc: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: ABI: leds: inverted is specific to the backlight trigger
Date: Mon,  5 Oct 2026 23:35:55 +0800
Message-ID: <20261005153555.85944-1-wayneho219@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179119698191.10341.17981065372386761527.b4-review@b4>
References: <179119698191.10341.17981065372386761527.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 12:43:01 +0200, Griffin Kroah-Hartman <griffin@kroah.com> wrote:
> What commit changed this? Should there be a fixes tag?

The inverted attribute was removed from the gpio trigger by commit
4a11dbf04f31 ("leds: triggers: gpio: Rewrite to use trigger-sources"),
which dropped the inversion handling since GPIO descriptors can describe
it themselves.

I've added the Fixes tag and referenced the commit in the changelog in v2:
https://lore.kernel.org/r/20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com

Thanks,
Wayne
