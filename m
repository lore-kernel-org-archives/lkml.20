Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602580;
	b=T1btlbdT7NeYQpoBLmcgB8JQPRr7Q9di8HztVcIvy7e1ncEmooey/S4PMvIicLC3svcs
	 bfF3BRxcy4rwksfUqCNAo13o3GpdVr5jRAoQDAfurEFpYKDNb/BX56emunWKgdpKE2+X5
	 FjJAXAOdyWwzmkL9yjeywDuDaaYrTSuiJ4fjHbM9peBd0bSekclbsoUkclLeA6bawmFXF
	 QNc2MEinRE9/Y1UDxEA/McP9phQIJ3dseHQnQqfTlaIanZ+MDpWdi+jzK174e88Mynaq5
	 FJIP50a0k1CN/4I/mSJK0occv+Wg4pv851kaygFhEXAQ2o+dy3HztjidkshOsZg0Y1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=1UYRjKetNPMdOuEAL+DzBuZJ1WB5Vji040ubXNb6Aek=;
	b=H3rYp4z5b6G/2eaYbZQ3hMhp9E/bdvInpIinJsiLXq95XkdniUYVWQtt1cCfPzBv3TYO
	 HCWEeVaZaZyoWMXcphhmQHgQyk8aaztAqU57czX+qHfForbOf0lstc6VnTOOhpwlvDo5C
	 XdzsroHFmH3hBZ5mIZE5C2mBaMJgBaFiXXWdVnQW8g1W/nxKvEuetJRuqKy+MyJspvk1O
	 lPijqZgVoSo5pmXDhlig8xQBzEUpYP4f/qVmHdwObiDY4U6LjHCKcJazxonNzcXVW8M8e
	 UqrdQxEFN8GibxJ0FtYMkMcFyzeU23fAYRvjf+iCmkK+Raog/485Gh5wa7+SDPSa+eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="e/GmYoEB";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BA606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107BA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e/GmYoEB
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533861a59b8so27327401cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794602579; x=1795207379; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1UYRjKetNPMdOuEAL+DzBuZJ1WB5Vji040ubXNb6Aek=;
        b=e/GmYoEBC2/CDjguAsg+P6LqpCxzE9o9K2hOQ4GT6Gk8syKKGC1vAQmV/Z4rLZY16m
         +8oEzYhB+JQ6HHYRlRgQ1H0WtSXyUS9t1CHyxVUcfQfeyJkskhnfkBVZz5vqQk91yNXm
         ih33+ivo+U+OL0p7cV8pz2wRhbYwWtl4E/NygVma1BGpaTx3eyQo4F0O6i7Vy7/SfTWa
         y50vg3nA3C4ZuBvrCMulyrxX4vinodrlNubz0Ni7jLlkKddGHJkRJf1eMJPX8zzTsLkf
         MGbI9IL5k664+xJszHfsEXuetF2KNdCqjj3zkMcBFXbzrO3XG7H+kVlWkaFGGf/zi4wv
         inHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602579; x=1795207379;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UYRjKetNPMdOuEAL+DzBuZJ1WB5Vji040ubXNb6Aek=;
        b=CQ//xGgoZZXU9WJ27DZvuAjjeIPgIbf1Pex4pDsntodLcaMrA3CsZh+aIgaf1FLx7i
         H47PsnFFxeuNxy48poVRliO/9kCEJQsAm6SOv5MdG+6xzdovsJhSe3OGs+iVBbzcFOdD
         74wDLNkk5cNykwrnQfYTrW8SrkiViUK+W234SeIixk5nkpAuJsHA9jVhi/Ayq9pYximD
         fgSUPG5aRutl3HoqP6f8WIA44bO92MuPW76N7pgD0EO26Ng+nzgtbr5Ukl8tCLh9DV4c
         3FY1onW7b6Y6RfMlrMHHDA3y9pRhOZQRybTZllxlC+I6orts8jMpiHbIIDEIaJibncLr
         0jGw==
X-Forwarded-Encrypted: i=1; AL+hErHvEBuzPBtdC/9rFXz29sWCzfaygFBHKzmXJHSup5E4Fl5o+uHd6PVjVTu4gMimGOYfoOfE7ph+I9K5vKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8brPZKZkVUkXlu4apHyqJBNuPz0d/f8cO6fbMWGMjeVvdL3ExY
	/sQf/bukoMSHacOkTIUtVFAzw+8z7+e4WeLHkEUo4bgmPVEbyd/vZOMPz+JvGa2hUmLXAZRvW7G
	wEy5h
X-Gm-Gg: AYBFou2VNocF0RwcnGaVHIdqYYoW4edf93CymRAu3vcTeUzczk6nXBJfwI1wxbO+taE
	NuzD9rrzit2qCkc0eeanmE4IU2nve65NOC+cDHHAOEqbba3GEKtGPCBIFnap4XvSLGU7K9C/0v0
	2POuy/uZQomoCPyhmh9APmxSOjYbiZS0M7JcD9/pByiO3+SNIEtbnmJQc8Yx2H179RprPWZeAmK
	mDRK2UuZN4j2xTsL2ak237zQiuztSlRFCFgaTg1HnezimVzqwqjCEtPclYiiI/OFAmAugU5IJ1b
	6wgqiD630i72KO5Z7TSrUdxwnMPNlUM7cyfxhadVw6Yr1kMeh9jxK8/yNQcAyjBtw/UmkRWVFpa
	DWiYUeennJWSvhExE+bzqqfZzXJ+1KbcFkdzAuzYND+hdNayj2ih6ntNHQn8Gdxh//yuWtrAJc0
	tScerZTyJagxt//oPebfcGpCK8EsMWuAaqXDU+xFfW/d9QBvA57/yCZ3jkI8fOqQr12QvKuz0NP
	v809kWapkz0Dh6lPN2DRXE43zX3WQfwicRezubnKlXENQNTOfUvbcuOcufKM2N8jnT1d00TOHDi
	exlE/XsSf01xUxWkzftLhJd5NBoy8YPRAYfIP1cmfQbCM0BAA/mUY9qYIV2r9HGV6Cr2EaIuYc7
	nFl4Ifdc=
X-Received: by 2002:a05:622a:a882:b0:54d:72fe:f3b0 with SMTP id d75a77b69052e-55ac8b983e7mr58211941cf.48.1794602579094;
        Fri, 13 Nov 2026 12:42:59 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55c3b7a4adbsm3582051cf.19.2026.11.13.12.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:42:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: reject shadow-stack mappings
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, jgg@ziepe.ca, 
 leon@kernel.org, akpm@linux-foundation.org, kas@kernel.org, 
 dave.hansen@linux.intel.com, bp@alien8.de, rppt@kernel.org, 
 stable@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
In-Reply-To: <69e27ce5-8378-489a-ad8e-37c364cf63c5@kernel.org>
References: <20261113195536.2660763-1-gourry@gourry.net>
 <69e27ce5-8378-489a-ad8e-37c364cf63c5@kernel.org>
Date: Fri, 13 Nov 2026 15:42:58 -0500
Message-Id: <179460257810.482102.3687220421358656606.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 21:03 +0100, David Hildenbrand (Arm) wrote:
> On 11/13/26 20:55, Gregory Price (Meta) wrote:
> Cool, so I can drop
> 
> 	e27dc0754e3f4 mm/hmm: refuse shadow stack vmas in hmm_range_fault()
> 
> :)
> 

Haven't seen that one :], i suppose *yoink*

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> 
> I used the comment:
> 
> +        * Shadow stack VMAs must not be written, and there is no particular
> +        * reason to allow read access to shadow stacks from devices, so just
> +        * disallow it entirely.
> +        *
> 

Seems reasonable, maybe addresses Jason's request for additional
context.

-- 
~Gregory

