Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246184;
	b=zgGY3uu5QVuafI1dOKAYrZkbKdPhUJJJ0S0+RANlk23IMoz8HD9gxXNXF83oNHd5MHrP
	 ZB+KGj8Fwczy+uT98ddkR33iT8hh6kPu+j+sp0wVlU/FxppUO8QarcD1jBqeU7/gsN4lv
	 qUjm+Rr8JXKm5QjXxfTu4vUFR+uo6cyS4ekDNWVUwSRQ0pDBgJH6CtGjVkAuQ7hU6PJ/c
	 I3C8Gxxitmjx79dzd4BVp0cNm9Xf9K9p9mlZK6tqQ4DncZCi8KYz04lQqJKP3SO/Zrp7/
	 WWT/xJ+K2Vrld7OJs8uskFLPc4HBqFrof9K87GwmwzuBQfJM/G26S0/mfSzaLf0SoJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
	b=aUu2HLe3yDrDR2MxCAvTQjw5BjZau+ci3w0f3Pz1IP89cW2N3YhM2YJ6qgJvtaEMa8ou
	 rGz8qt9cKHFK1ICGJ8i7ds3CHmn/nIGBO+rM0ysZIcFqOTvhehAqY0CeQLEZnthW/QjyV
	 EtGek6yMM0r3G39iZiBCYuFfoeRbi3abgtk4lyrCKmfFRE2PrunxCXeEgl6+c0XVvdFDE
	 58sT1SvQS0+S5LMGyzyw6Fx28AWErqqU64ER0CgfSKjBxB92srI9fqGpFV9u1mtFQl9WU
	 6EN+yefGkzb7AOLiOAuy2MX1U1YbXjzMf8mUroUly2M2gBnjO7k/SS4zqK85W8M0ZAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A8606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4A8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49318428d98so635104f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246182; x=1794850982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=ckZoDddcTDuBB8D2f6vOtjEQlPoWOfaWhUmDEC61PQ0X0I+yEL4gEl5NEH/GGcwKWJ
         m0SWLad/8xv8sXKhB2ex0GoEl/vKHwM4LWi7D4bbNIyr5KUfSAdRJY+CM/A2eRweKoar
         7i0/2AzyZy97qJxXeaOO+fhMRwAPMikx2EC3jEzJADjIUKU5xqX9L+MtbWhs1NWclFTr
         NLmkJ+KaN4LMAT3AIypj3QwrDkVE1vYGvramUDwAix4DzDNmmuiAdd8KkGVC5ROtdDVq
         IPuncVm7K0fdgckXudrURlG7B60nVfPuG4fDg/J4bz7uc0lyfzFoJyKEUW4BvlWXnLTL
         p9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246182; x=1794850982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=qlGU7UQFUikr+E1HB++gQ/SGAC0yzG0Qkyo7e40HHEP53BOqCNRJotK8MmjBRT2ZDC
         9fRks3FueZkPD8LIeYF4+3xbNwqmwAnqx3rk1xRhqYOyQwru/Td469CBwiR4NtSZKg1C
         Nio2EiZHdvfAvDldXGS2uQUQctVm2YB67oh7bB3sUZOuqQ/rlcfWAA4LU9V8bbY3gngQ
         Pkn0jUJoc3yXnCSesEQwlKSoeT+ZEbPhGX/XnIlaF0L0fGKPmipIgt1fHyxVhHwHB5Kt
         MCglU7cJcC8DJzHjSX1reg4DBNMKA8+VmylF7TnWPbcYsd3hxxP+lToj+pnZ9BBKDhQI
         YSUA==
X-Forwarded-Encrypted: i=1; AL+hErGpzfaY43VQahItKyEdSwnGVljWt756ey3JO4fgFIyiNj4kI5zFNBheApEUNXiCGO3h7GFq2u9H3GHLjO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oIB2dkxbG0qb4JBFivh3zR8uNYb2kyrRqzMTwk3avHkqCQxiM
	Xwi+GFpHYvXLGxkXsMRzkBaI6X/9UBxHn28mW0D6ZF90lImF1bTsvlnWic2CwGRUAFgRIg==
X-Gm-Gg: AYBFou34Wc/GCVlG2zHN10BRg32UPUnK0iG8trUYT0bY+C9esPWBmor7kmEzKF+2H6v
	RjFFw4Qee0ER9RH+iMDXKv5Fc3gmjsifI2au0ENKIWT7sT/URNiazcA/JCJSv0EX4jD3QddALZj
	vz87B0ae2eY29ixfX/aaARqpZu4OYqUTG4U56V3LqTV4o6OnX5fcLNcjYKDW+nno8XH+Q1yuAUy
	EJDta0Y1hulgxEU0jINuFn7CQ+OLxBoL0rrIOBBy4nBmcLkE5JgsPNJBCVLL2HvA2P3DTZab/K7
	mE/MmbeDPixsiPYJAaMtE7jBC6xScne80z2ddIw1BiIF2A+NfNnhNUvhjqi08yYfmtLwrq6ZGh+
	SchyFskJdOIdakJGksc9P+YCciAtkHrf5HLqyFOvaGOGYqT0kH6cpUz/gCeaGsVea8oEff59sv5
	KQTfhbbaEY9CJAuOm+Ml3ocZZuTEizbIBfUgVC6ZDvTkPw0TGyUCit/IANUQ83bgVs4t2XhJW09
	7KWP87TjJrQt1yoc+sKsD8Ih6tRzZHsgw66lOrCdPf33K+ulXNNG0COLdRDhFfzO2aoEd1vXAmT
	NYqmN7bk6QJgEFDGCAzThFyZG+Q=
X-Received: by 2002:a05:6000:38a:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-498309aed15mr286975f8f.44.1794246182227;
        Mon, 09 Nov 2026 09:43:02 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f175c9sm157557f8f.32.2026.11.09.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:43:01 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
Date: Mon,  9 Nov 2026 17:42:48 +0000
Message-ID: <20261109174248.2086482-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com> <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com> <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
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

On 09/11/2026 16:43, Bartosz Golaszewski wrote:
> On Mon, Nov 09, 2026 at 12:28:37AM +0000, Stanislav Aleksandrov wrote:
>> +    pinctrl@f100000 {
>> +        compatible = "qcom,halliday-tlmm";
>> +        reg = <0x0f100000 0x300000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 225>;
>
> make dt_binding_check will not raise an error because it ignores
> non-existent phandles but please make the example correct and add the
> tlmm label to the pinctrl node.

Thanks, I'll add it in v2.

Stanislav
