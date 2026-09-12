Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03856340D9D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222823; cv=none; b=Rplcpt+AyfpUKx5jTi7xmqTMf8D0PU5jtPWP5VoGQeyTDrurdaGtKO3OZLScfbMIAKi3aOSJz4IEqPhoj5105GOFiRSBQOXF2HDuXp2O5DxVpYc2V+i+MvQYsL5+I27Ifu3zp2zj9BhTYzSfkT1b97DcROIzJuCv9wleG4mP5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222823; c=relaxed/simple;
	bh=biqxF2WqF9FsEWFi0SeRE5ItXS6SATDbQxMgWQtNwgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO61woYv011jiT29ijbdewwmAWvF29Lv91MqZE5skPH+3cmYlH0FgQW3xPoIeHTtnVKo1EnHmYekLbotvfvc8JWHgesZbPIdPSHZHMUeL2HhrJbjZ5iho9tRNJpGv5V2kGZihmiMSchB5Ed/5j0xac+QMapJGxNKmuH25sJd/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9wS6sgy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9wS6sgy"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso458868a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222821; x=1789827621; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=we0ycuhD13NPMWrxsYvOqSZt4f6T+4762jU+NZLRKXc=;
        b=X9wS6sgyPv70YucXExX/1Ce4CRnkgEBlcbO4tXFe2BDHC5ArRqa3qtidYPXbc+Eb86
         t0mtTuUgnC3wg6ofDeOJ0aTvX3bUhY5Ktd7u/+uecMOcrv+vBAhjk/aq9zz+u/HFyO+/
         j35JVG5kq7mNh+HuEE3Yye9zQxxnTCTJ+GuoOyhGUkS5sUPnXXGr4/ZHm0BPUWIbpty1
         Kq4WauWQpzAb/3mjBQtH6WP4wQm4W4uV+2X8I5QHGgF3Jgx7UaiH3mOKt2who7ft2dck
         plOwJ3A5714iuVwbgSw5ymHhx7MgqNunxTATC7VsY4aQe6zVBWd+3OgROJDd1P+Xs1Yr
         XOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222821; x=1789827621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=we0ycuhD13NPMWrxsYvOqSZt4f6T+4762jU+NZLRKXc=;
        b=jW+cqhq4je13QUvQhBDCJ0H7WHWCMieRC+/2dglNKGmsRBLdZBuRDry8eqN70vYTF8
         v823vJFa7tuP63km4wOBZX3XGi2v35NZUdkcJc2nUjsNV3bgUpP9KiR0JRIs55j50REe
         7tdlqnFZ0w0Ou8KlsRl+SE2QtLD6RGcdSp+bbuQjkdhLW6ReqEw5DGT12o/JRLpCWXlT
         0fc27yCtFAiiNeXOmgLibavAhYGN4BA1nPde3Rv6ZZF2Jp2zi/Wh3aiojO/nrP4Ze7OH
         yBIF8n8gGMMNs3vQgmoBSfLAQCQ3aOU+XLF+30QyJqMZk2uctcV39C7L/HTfK5tr8vqY
         qhzA==
X-Forwarded-Encrypted: i=1; AKwUvBz2rwA7xH9sLWCBVSRR5Fe/9F8XklFt6dtwFvWNts6pXHF/1lVC+SM54+nNhxRP0npf4y/OdK1V1aFdsZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kDeJBj4rIhM2pSYxElBWL0hW/wowSQDl/vFkFtkp6VBqzwltN7
	M191CR8OGAjlkQ6bJXzx+Wtdejavyc0rITtmYwH63occ9FZJo+bOSV/a
X-Gm-Gg: AYBFou0el6sf+eqVvfvtLC2F3qO02Q5HpxHs0VCjTA5IUfY1TGn31IZquXLz/UzDIMR
	Xwl0hIOkN2i4VzwuZPKBP6KJjow1NwR7szaYbLsqaKY5N2IPH14p8drycu3RTNsjJF155AMHvNb
	b1zzjdFWt4/AWPCTbU4pN9eQsYoioZvUQ7O4DJ6DH5mApdUvRYyRsqYohWIk/DvTejWaDSjfCgA
	TuCujvhVplBm3wDlBMcCRP6X+exLTmigLmZ6ZoCnQu3Xtd/NmosPm8JedUybUMMYqM3Kv43OCfK
	wfi2JSiexMzSF+bLi1agewCuUzlbpt1z3+Mma+8tzcYJw1yfTqh/YRTbgHOrdloJzPhgHHYawrL
	W9bw0or6nLSqVm7HTpdcDe+WYthgO2lEIVASb7AXo8GPSdCHT58QtR72fmQRvmsJTwOYuYnwvsk
	8rNfAJTEGe0cO9WBIhHWZ4ZjbRGv+sZcLIq3+F77Dts2x8qYYLNULpWzh40u+H5mNiBEn9qhgbI
	hidPb0LM7PL
X-Received: by 2002:a17:90b:2dcd:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39dbc6d53e5mr5724044a91.17.1789222821301;
        Sat, 12 Sep 2026 07:20:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm10641268a91.17.2026.09.12.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:20:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:20:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/4] hwmon: (pmbus/core) increase number of phases and
 add new mask
Message-ID: <5d6bb7de-5cd2-4708-b894-fe8648a9c49c@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:37PM +0100, Nuno Sá wrote:
> Increase the number of phases to 16 as a new upcoming device supports
> such a number.
> 
> While at it, add a new mask for controlling the source of the output
> voltage.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
