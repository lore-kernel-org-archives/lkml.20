Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E612DA749
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789833955; cv=none; b=QtbubXiq1Im69Koy8Cr1Iyvo1CC04JuxpbmpcpTMDDIGc9CQvdGyvwDI4zZwWpF+lUupJcfWSoD8YhyH9MEVVj1dgs3YFPs3IS7OadspysZS/Q3/zTFBbYZ47Lj+sCagV982lH8HiNnF2HEbcrihhCwnEIqN9X6c9TpAWGzmlzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789833955; c=relaxed/simple;
	bh=YL5NOfKITAqZhmcfQiS3NnO5Vg0S8Lbljzem0nHhaSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUjJYd5vhJzEG7j2XSvIouF0AamMZ8KWoIgREOK7zpN762/VuWw6+WOJ7u9VsLhYP4OpgKX39Jzce+9uqHmlRYN/yMCg9FlZTXCfmpJET/4mHWbwmy7o8MEVm9BdMHW0Ot9ZogYQwKEyrqFRnyeyk2GVM+a7hwAlrDDygzMRj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=XdBdTbZO; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="XdBdTbZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1789833951; x=1790438751; i=wahrenst@gmx.net;
	bh=YL5NOfKITAqZhmcfQiS3NnO5Vg0S8Lbljzem0nHhaSE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XdBdTbZO3n6UeOcTnsVdxvi7MGuGQjeJkSVsV+swye5NJS8Hp55xNDBHEo0Tzi7E
	 Q6+oeAzyXoymKiJGaKZ682XqBbLq+kSQQSYoDaxicPewfFm7+R51QAo+7/rlF92jX
	 VMw7Ndf/nf0w9wBEiqpbpkIItr8DgogOUHabY0bgcK+AeCvfLalDJzTcc67ANWh7e
	 lMnngeXiBOo7buyQB4MYSeKWL1g7W56QaQ58P+8FJbujIiNPvF6QKd814WEPHYdg8
	 Scl6lHIyyu+ALPidm2OSmsUK4/F68uzg/QWNkuMERwx6+MPiYLTg9zTjmZ7/UaNSV
	 ksz1+NAb7lQfqVdj3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXtS-1xGnGB0ELI-00Sejo; Sat, 19
 Sep 2026 18:05:51 +0200
Message-ID: <af98e96e-5a2c-486c-b8ea-3ae3fdab8eb0@gmx.net>
Date: Sat, 19 Sep 2026 18:05:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: raspberrypi: Handle device registration
 errors
To: Triet Hoang <triet.hoang.dev@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
 <20260919034840.28593-2-triet.hoang.dev@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260919034840.28593-2-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LhsZ6XJmt0tGGwv0bbV5NHWg7m9nFSCDlq5WtHWVJqwXQE66PKx
 fS2clwjUvs04HE22gbKJG4ehMcn6aqfzUOflQvEs1/0TmHdlkd+WYF7l6Bu0kquK8HYzbUd
 uo+ftqNkQ62OVqdeawnnCSUoYQm6MJMkOCQN+7am2HUBMTcLm3hmLMQN6uwhppcqpK/UMc6
 CJ3eGJxQY/g9MfWQ/raew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gc3APo+ilEU=;zCsWI9+cx0n/AMalTeV7zVnO2Nk
 fIdpXWxL7eIWbao/HSmzo+QU0/K7yh3ej3yDTweiNt8iAsoVy5CEQI36YmPA9ZCabvYpDZRdQ
 hNw/JcDNHxbW7VD5KUPThiS45gYD0dlYujt02HJsfYD7YC9wiDKbPMdaCF2DzzWt/wsH7ZPZG
 T62262dfPpMnUyuzO88xm/euJ2zZur66IVGlTZdAhnj0xcYvQHF2KRS0Tf4AlAv9jraNdOHrK
 WSDBnLgEYWq/u4jYNF9FJJZ/IiZKqO1I3GF0xk3UTQpz5ZKTT8V7jOYHZRDIr2G2J9ee1eax7
 +7mkTRWTOVkAd2OYYMcspC52Qc0p17ICCmFveNMO11JOxDnu1CLcpAeCU9O57egh22VfnY6qC
 3tyd1IBu7Wa7nRwibuJY/tvOtJJYJUju2O/Y5bMqwFbrea1PoBnFZVIO0ZL+kt/824bbjnGle
 1QqoQQ3zNoauLW0fDRnm5oPRvvLMiZz2KRhtNuMySUB2nfNZlkpyIpQRVkLhdCrL0xHRDBlkH
 eQkYAhJSKN9p/sv2WP4bjsyMtSjcx3IIvO1trUvxogsmpkc6dmEh6xIucdfKsDbdLYiql7VBV
 Te7aVRUhm2RNkPhtP7wRx4P1tGylTXYlgNcUEXOcj8fvMhC2PIhNwY+ERTfP26Zt58fwD1BCK
 9MqJoGGEXGtDGc8nSbOQ28rg9Iloh+uIFeJsNJlyVmbC95ot3WemzeCSfYg+mhhnLSHkbwgX0
 dcLs1Ne2HY+D1m3Kg9qMViXLhUuhqAVglmeGXx7kNbFZff6p6phmA3cJEvD6lMhaQd1f6NSXC
 NTEdm5WLIYeVxM5FVI+572F2dPv5da/pEWzd1ESoXF5Dr45bmmxB3oYN5ABB8fySHT+W0pLP4
 XuIuYv7mOuYLlBawwErYmWruHjiS5gNrZaxpWWzUhxGiFcFZB55qhJMGBCvyfSU90zAxST/p3
 fAt7JRUZISF6qfELgelYVtNgdc9w9ahK7BZ4n8eQYBAaJcR6w0p0P0k9v5ul1eykCJ98v8878
 aUSZgRQ8lOFGSnCu0vGn5UdmEWLvjOWqrWbmN8x2qGqx1SbC/V7l4cfW9BR5dqq1qOmXlL0rr
 95TT1wKrkFNmCHSUcikm8fdb9zt65YGtqA5Gi3tJFdIyLeO6W44ScNhGpSeobScCedAfGV36D
 w56PxVhA7X8Od0gMqSmcf+HC7oz/moewuXtFm+TVPzbctrC7bHFfLl1upNWanz2RCvwQ8E4J+
 tut/t0KH1nAIstX1HfAXofTl9gaDIbrPx00IAM9DWPpsgCzujcCEgPYqayZ6t2CnNIn4CUree
 ZbC+Zn0LuUadtR/BNrmKN9wNSikXnUY86Ytppm/TIeFErUBnimdKC2xGXUOXNpONGKq6xJY5S
 dGnjR87f2pnOarAzuEAScnMnjDSLO/6wGkn4eUa0BJ7jUcDuVTDqaGNPcTKGyNPRjaBqppTux
 TVOZJY/QxocGlCLBMKCpHc2w/De195tinH4lst061it15nwB2EAn2Iv1wOl4s6l1j+ET2rB9I
 mdrFAhOp9Cf2fpn98sQi6fyOZFcV8G0k21O6KY3yRx6D+nrZP4doEqxjPJWbrQsnDY6nc0I0c
 iIqkPhhylSDMC0AMDnPxufU+1G0EW64oBeGzG3+ZRQkE4rAVgUrhZVYuS8rKdnDa2UyzFoWAD
 CtM4dwFPL07p/6Nk/xc6Je4n8VupaYmVbfDjpoki/cXqhYCGYb9VVW6gMfB2DqrXh9LylYf1P
 C9rWYLwhLrI8HW/YBwzLZ03Y4NWQOCvLUbynAaR+OtCfvz3T/IrLXTSVd5bObAUClGxPKFexH
 xuAYeP2eNMymUdUB/LRDhWO6tPXLk7SUUQsC/zP8xWEuFGfvOqOcif1EpDENPYHDaRCaT3K95
 Tgqkz6UU9RQoWFXtL15h/ANcc3XUzVIdtVYw+2bE2QIkJVRU700YKWYunn0SYySTArF0xhqi+
 BR+2jcwchRA9u+/y3CFSryZkOAhYpFrajh93X4pdv6UmmG3DNqt2RSVhHPtxs6L0HtsdG3eOu
 EjpTtbYnLWPGWxNH5O5/Uu4ZPhG+4XLAZSQrN6gnuaWbC3eQRA9leaJPMTAUhSr2Gn7aYb+7m
 hH6jc7fBSS8HVZGjHb3LoGzVEhR6PKMcOnjlk7CB1d4tPdrsaKaI0W5m4BJFm7volckPYrypu
 6gPCre6M/wK39AIhAMMw15AoiY7IZAXTI7aIVtKJnVVG8lKRfANGJfm3WEDKtn0sSzPkYdPJI
 NlhAsIthNCG0HR74L0KlgkxvG63HQ7OXWmH1djy3/5r6OfDWBljPynRCLzg2Zns1iChhE/eaX
 aUMmUsY73V/qL3zB9fqbBfEi4KrER/xl1NbPuZFmhFewEbYRIdPmmghoBuzNMuQrPwd7CZl/Q
 N8mdmL6ib6ZnO9K7uCXsPCEyWp1jb2FjUtSsRZXau+DKMmNB/UloJkUytrJBPljEj7vCmiQt3
 IGXJzScM77SWsfWktvG0MNmoTUQoF1cypKhVBHf4fcdfK8WfhX2Cyz24eEUQWphGvrhdGzpdT
 U6RwHkBVzlZ+mrfRsveJgVQoI6mieHLdc3APgjfZt/bADXDvey7bqvB4s/c/vUsV/5yw4WdgF
 W3M5Yf8LZiaVI0RXCNrYsYzAnwTqGcpWe64SJnqmAzzbvCK5ijJSLxg6d9ln0KzWfUO/1l7dM
 9w7/V2NjSidh0k66NhttD2RNQ+bvxf+EiJBKslP6pk1byaljjTZiPgHH36mLLPAWfWKLABrSG
 9yZ/Pb0dqXbZO6lm4Ms/+SyeMgZ6pYcJCYlsp8LL5vCiMn3Sq2gjvSmn2HTLRXHIZ/rfzsslG
 fyZIOyK6eAtiRZ/1HExDerg255U8rUOSo8FtI3MlnKBujggGdwY2p9sJs4W9DlSPz06qNszgQ
 lnwjf9rfOsyXTYB6quKKCTP5fW537GrCy/4Y8Uw0SkM9ppBc1SM4JwVtVpXcP97dJQRZ2Dj7H
 A+7St2an6E6vGMP2IcmvCXF0cq0ziSQu/gDPel0bMt9W5CPPCjF7JOR7NCQ8Vq5ghIB28Rsao
 Q7RzvxwSu6mHwlfaq3UossLzKZQat7tE9qbqYbszG7DfkodBTfO8mWUJ9+Zar8zfwNkl3zXKw
 vbOt6K1/5lpMTOyc+NB0xfNxqvhkxCdmnWh6FySN5R3m1bnJfej6ltSQvqOn9b/QDeLGqTiaD
 hDDlWTdMz9eSVh1vA6ckX1hUVZ78JiAW2ep/VHABEaKMSVKx9s+kXiAwzZlGU2ATAMdjbYLCg
 0yk2UjXAL57s4216GB1441Z0O0A8+fLaM9ceg+ClgM5pWu2sWu9YgB4ULNrw34D6byOFyumgR
 7lLeAIwg8DEI6AYAlyFbcgObIDF/0bhox/jCJCgDa28RZZr//VIIYwTaMVki+II5edRTT/Usa
 J7kNnI6xj4Z0BcQK89Kkkw3/L2IPeLqlWbxLXt/rzD3+C2p4wuZR1tvNOeUly/RqxhzMMjT11
 hIUDW/nOtl3iecCiZdB+pdiLtDu00XxBNNdKx4VbKuJDkXsIKe/BIOvo7P2wdPMMkJTOvzrgJ
 QuE8m1NfYzLM0F1Oe8iri4fyc/90ZS2W+jZCS8PeuCXkAA284Nh7aq/79LRUr1MZLBrVcIIhS
 /l+BypmSz446QxDaOmnlozMN/AaMz6UDmEvFIjULC5thX3PorZwZL2AgJCu8D1uh+d/sDS61K
 0TALewmHcZkwju+k2cygK3MfXqkr6AueRm1AKs6FoxXYIJ4sbhz4S/xq7H2QOgFE3wIkdR/xH
 aeq/IZFOgL48NGY45Gbz9QFzHINPFaF4lwmY77eX+a4wGHbD3WNtSG8/bKZq3MJu6s72dogDr
 J1g8l6CsXGPDvmkGc7uVvI5rhbGECdfQp1ewQNl65f3uYD2Dq7B9ErZ4ZU2aaMKw0mr6CvYw5
 kCmQ5nAL50wAM4WPfv4ptp8HoqZ46FHNwQBK76brpxDF4+lytJ7dhcDMJDldbE/HaiMt9k3TM
 kgKGhmfMou8CokA7N285lkpPzp59+sm0IQ+yc/NmKLihAxca/jdX37lkuPLiQCONemzhGBPi6
 clQi7x6/IDT97xJ9qnkGdTgOkNsMV9s+nSC4AL1VBekkCDrUfJrinHOmWpddCrcjbFlRaIc82
 5sIOH8G2XADlKPC2h4RL/xuY4xkzECx7n/2bHaI69O8vmdmpC1OjEG1NxZVB7U+425lRH8MY2
 bQqv3Si9Ysv0MqYR1G9WMrf66qWeFSwCjC3b5T3/Z9grcM0ZJEOCQ5nx3KMjdaG+ZIeON00CH
 Ax0Clmu2Iv6ReP4m6ipGYz2AT9wSXWOju9Y6lARuirfixxKGQetFk5jqYLBEDRMXc6q9c0eFu
 d8rGkTxz19C/3/WzCxQmJZaCDc/UqAYEYR5s82E/Sh+03RRbyJjgG3H/ByujJsTQxW0DmfRVQ
 Nv3B0VzP3w6rWPoKAfJATsVRASf6PgWkhER0UWFok9NJ/L4pwVJ0/31hzxxmOkdMkUbw4lHOf
 hUun2HhhN9JSlKdV4PH850bpRwD6JOwvEk7417oToscdcJflZ2nMJIoWGupRFvFSUxRt/nN+N
 2S+mVMEkp47x2ptgJAV8/19YJ9BPdrA1EOaR99FST/CMhlwSpb0BXZb2pLZtxqcccU/+ZxJhs
 HnElGMc25H2mxh2kYkmjNPgfB0uKX6Xi2wPOjnrN+kOKy8ZgBVY6JyZrytLYh7/Xmg+YTL8DM
 wZIR6bzjuJVnPPf/dq00dey0Cz0rzasiUura9fl1xP4sKq6DEhIj2qBCytuUEZEBWecrdRNCo
 WWW9TBH0H7tZJFs6pvMsmYttW8nSsyeCjXkAK/XUQAEFvIZv4d05VZqOnA5RIadPwy2IlUNlM
 +HbAko5Xye4AZV1h+zuV8kaxxskheicYO3Vh++id+s5m/qtzOuP13MybJ+yvQ+Zp5HvC4bf6x
 4Ha2JPGo4LTZ+6Mhyt8amcl3sqOfeGGnTRJLyyQM4ebcxPV3B46+uOwk8kgXcfc34tAMC/SAU
 3MVUHA56uE4tnejy4wCKRock1z5wLtoqczKf4s1O7wRdSSBhXjC/OpHAc0bsXwSB7l7r2BdE0
 6dp4DiIVy0MH7ikoxMt7LYVI+/Aj7F5JZuphcQ/hLqsTiHjP02E4f63Yu/M8WpFJlbSGrcTlj
 GqB3CPvuRbGe09hqxL/HzH8Jdqo3m2DOzjkdk3zWRJ8R34g5lR53fuAQk6MOXKAaDY3c78zZR
 6Nv4bqSmbS3N6oaYe/iFVyD1qBx/cdXFiT1Yq1ilNwavTVsfdZhZ5tQF/tSnWzRmEWGNLwSN4
 cnjyk/JyqPd6cSgPW5SrMiJjweNOULK6/9nAd4/He/r6WJRvRbX2fpssHnrOREhAWF3/Yfo3o
 30CC/R0BeRl8QlOFeFRVC3SEFJTLA5y0uQ5ei3YEfRWrCDak7RiIMOJjE+Sh7+zEFnyYd9tOD
 dQjwhWQpixs0MrtjWOFRGcwsnzJfm9jxJtrt1LafNzU/jTIKCBErsBGgXHZ9k/8vkUZVUZuxg
 S7x+YfXRV+Au3QRORzgan1MBxQC57RS6TpYKk1yBaJzkj+OuciQyTdD0RKsb2/h0PBd/c6dXh
 599Sml9KJw8c0vsXzb3RhzOpj3V6Wa4uYMOxx3PW1aF1EKuO6MU1B5LTWU3FXox1kxLyIWVyZ
 oXC8gyHaPK3GXHq3rTtORtHjAH2ZQPq3NcMRGbi/NXnSRLEgsOIZxCL9K69tPxaMnxeSuxXyt
 ekdWsXpfB/IXX7IxsPIxFV9nOiWAXzewcT6ZOqOOTjo/+FXawOUj7WeM5iGo08HcpJIWUDlie
 JW8ECJM554XLeoX8fOGnVnrxHXsswAzFskYbu8PCjPny5dwPvPsd4mMjYLOHAhHpuYFmoSazv
 xk84buwSpdZQZap/FmTOYB13Vp1GOxBTLv9TwAAEslT717cRXRegdUFWdY6v5KaQdNBzUwLX7
 CjHT7Ub1VTJBN2V4psMsyq2lLk8QuDSN1ULvOdYU/S8L+8BILU71m00aFqd9+ztbryg9iwaVP
 sVyfVVUGB0JHyECcmOfc3Eiq1/hblfCov5NQWAs/nC7N8iLSXvVHutaJOR12wTO8+vEieGZrl
 vDDEGKANWxvopZzu8TbGckUtpLcaywp4o30zuMlesQ+KFJSbtKQt0YD1/2aP8RnFApldhnyR7
 Tm8TPs0mvQeymByN+Q0Yi5l4Ki+bkbkKjUNkBqX+XHO+0qRcP9J+i65+NDz+WvK+c4E2eFRkp
 T7f8XJ5wFau+LZbXe/TZSwd91t8Pi4d/IC2rOiTVdxWuPS8bxNk3CjYGSxu7aMHutBA4czpys
 hLusF867tShq5M2ZTYG6xVHwOEQErIrMLE80HZf5CruA==

Am 19.09.26 um 05:48 schrieb Triet Hoang:
> Check the return value of platform_device_register_data() when
> registering the hwmon and clock devices. Propagate registration failures
> to the firmware probe instead of silently ignoring them.
>
> Use local platform device pointers so the global pointers are only
> updated after successful registration. If clock registration fails,
> unregister the previously registered hwmon device before releasing the
> firmware instance.
>
> Keep the existing behavior of skipping hwmon registration when the
> RPI_FIRMWARE_GET_THROTTLED request fails.
>
> Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
> Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
