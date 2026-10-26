Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974984;
	b=ddSgqRgNaokjlVn5Ud3BzTnE+UNDS4pZY/H8H2eoPFTRUI8sLiuGH6+2tzij4Wn6f1io
	 URiFvhJBI/QiI9DdfhKXWCBmdcZKaU1T8pLcqOxBuXUdtGwLsc40QRijTqYlFWDrUUE9/
	 x7SDV0MFXkwyfM+bVgjox7/LvyqutFfZrf2WLZeAFihbvbHitFzaryPmv9Tqd5Ds0jtoW
	 MNoc4fKhEO6lQggj/t9GqIfsNrbGisMQmvZKWzcPDFDruJcUGXHHdYkVVmL18ONFEOUIc
	 15AH36VzEo/in/fqEq6RFzmE9GYRkzpn+nwmeCiVBjSEJtpxHlAbPmqZZxrux3IvOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
	b=mn1NFAPWUi7GdXyTcYnAWc16fJP1nrFMlPkAitdyvNGukt05VqvGnrD4NTvYV+rhZIRJ
	 Pgfa0XqcgIiePaIIHkGQiJy60o6Bzh+Rwvsf4D8Y15kWETDVLGCvcEhJ2t1m1ZzSTRS2w
	 s36NdbE7Fn9+RLnlizCn3JwH4Jv2tsx/mzVMLPSUmZyW+ebwUSNpNt1x57G+fyrn/lZyf
	 jTrK8X+Eb60BMM+oqkIh566rRNH/3oIKp9xq7axAebTHp1xSDfOt7/bqDlHL6lXP9MOua
	 /xw+xpNTOR+FLchHWHFkZ74+lFQUa69pdpQFIaZGvU66zHZB2QWHe0rCkj6/U7HdLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/k/dzgx";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE264606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE264606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/k/dzgx
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so721191b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974983; x=1793579783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=A/k/dzgxFGHZlnRPKB0uFI6RamiDqcObc53ls5NqfEmj2xDJOQswLIvnDVWhoUj/1S
         OOsihDiG+3Gv4PBnR6VH4yMr/F6jxy0aYVKrnXYEqnVrf/XCqBhlqhLjIMbZGiHXjYRQ
         TtFUzok0tjLSq+9JtQbSdfjYDhk0oezU8aS86CtASqyVE9eXcAL02GPUsjSEuE3Ig2i+
         2mCLr88OhzqJtBR8P4dYjmec6q2utQ7jzwRnurfkrYWsPB3Siqmm8WkE0Ahey105KuHw
         1jD0MT7SCTK+x0qX4z41EntpYGV3zofbXUldvJVBFsJrr0C5UVQlqm8MTu2dQnz4eACE
         Stgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974983; x=1793579783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=qkhoWug+ij4B1izDVHyu/SAgxUR2cnxIl96VbL/cCDz6tcQks3EdMrCagvKXOJP4Dt
         Z23otvMotLW3Q/R9DWBnTuF88ylgvCujlvBEAO4bZ9/KRVD4OjWWcMvp4H1ApPHbVkKY
         v61GWByar5qvBOBfA7apN078t6Hct3R2FQ6vzeizA/503TiyMjcXliVEcP43Cfh+dnLE
         zhMFpIEIcAqVC2IflmLLRiSkOvXfYXx8obcvtjWpeUfuhpjbsSHHwa6jydF/Xn+Av35J
         tjiC6HZVG7kj3DNgXz251zy0X12VonkmYQsQRraIisD11WignPHp4RfwGwaeR4+TUFHt
         /BRw==
X-Forwarded-Encrypted: i=1; AKwUvBzngMNJKyHbx8d+UhrC6YS8bK+MFREyKVm2y6o1FXYSKoc/y4dsKGG0czLi/Y5vHTye/sT/166Dk348Zko=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbUmFwKPxGZEEecrzkr5MchzLbEOF8XCff3aOBcrlBeWK/DWE8
	hNDdIwus5OckyLZcIjsTlQDayer5V+zMB9Fx4M8MN2mF6ktNu6xq0IN6
X-Gm-Gg: AYBFou1FhMO+GoH167m2ToP4hWmZSYpWuXJLqfJAmuvwZNfQEJdpIL+bp++rv4YvlBA
	g9bW8UtnZQwQGZVcWGa24OPafQMLancuAoQaj2rfB9Lj/+XlXHCqLhHB9WhcSJ1HH5ZJHCAAKvT
	EiK9xlR2G1jaKcteAHveO13gKh6YhnUwmiyFlchLQIk+DPH9qwjbCz2tedbGtTKzXacm26KZIbJ
	XxPAdjXA6IhgnUz8uwiJinwkFJKEaC2RsNOknhTNz2KRgXI+oS1SEe6mtqGztxFE6ecTEARbERT
	DsY5p5Zl+sABm001yPwsdgaillq2DcbbIbYpCt5NPRBnupH2+O9dSpYt+vjV2L/MpYX2IYSazHF
	Eaw5BuTFABoGerWD9geeMEC2nezZqU+hjira0Hz5MQmbDMYLhO6s0gTRdU3QFNwMD09HKW+xkFn
	knQLtDQOIZeeJMkong1qpYtq0GB/0/gZJhVNvfpUzyHQ6+nLdUHndwzEwuilvNDV+DYkpOrPxdT
	thnRoVWXNBJ6VFbP+ykbjas5JR83LNIXnCDr/Ab3jOwwc4vsbXUXV0hpcGJw3rJjse3QA==
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:c08e:38f1 with SMTP id adf61e73a8af0-3e7cd4d9f61mr3858101637.14.1792974983056;
        Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d86790sm804169b3a.1.2026.10.25.17.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:36:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:36:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Message-ID: <b5298436-ed79-40dc-996c-887b2d4bca73@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:06PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
