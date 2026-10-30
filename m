Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.91.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400066;
	b=UvyRYltageXmqvEzOZB2KIfe/5gqtZIwQ6o2jW/v6STTBHklkXQgyOm9Ax49DubA+MIk
	 865yhBzKXrrJ8fyn/bhGHi7CVUraF4GG4dKq6VXUbML+fK3Etup3cBUwA/1Mq61bI1TWX
	 tUQv482AuPDKRX0Kj+Bz7PEzDYTL63OosNgFXyGkMT5+Uxz2nnZpMvW9FoJDUZhzgKoWT
	 LTVP1MxL9xGAJtWPXbOr4Z5WLNac3ZUX6hK5uhwY7ileBXNcPByt9BlcerxtA3EHwULuX
	 HfOE0MEUjQNozELOkgm31fgSpwfFTczv9OOnT9IKQ+qpMEdw1fvdkWxBg6opJWKIpQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400066;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:Content-Type:Mime-Version:Subject:
	 From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=0gIgGhCHm8bEpsZOPji4A4j+l9vAgID+Kd1kyXON6Fw=;
	b=ucyFCSf6x93j3Kxcv6hNhurXvJuYqMaufSgpdEhpu0ySLafM8E3YjtOamT25oH436Q8g
	 oJdhjB+r/CdsTkw1td3X3/8b5uaChJO3vlZBjObqF/oH3s9k+9iBKqQ3EG+qJ150OtjLp
	 kBYgaZ5J5POF8oERGY59MNAHCnbmOJvj7DdxL65ICgKjKGQm3xOU8lAKqgNrX5nSMp8kR
	 yo9Sw9HuJP3d/C/KgGlmnu2NIJ3Qsu0mI6q5X5JEESu9hcTmZ33iWMxehM205cdGzjk5R
	 Ngef4UbY8IBFxVe9arrC7Pagi2hzJLQy9Csu6szbL2pY5OwcM+H9j+La0UYqj8wlxZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=manyhobbies.com;
	spf=pass smtp.mailfrom=manyhobbies.com;
	dkim=pass header.d=manyhobbies.com header.i=@manyhobbies.com header.a=rsa-sha256 header.s=sig1 header.b=nqExYuXf;
	arc=none smtp.remote-ip=57.103.91.171
Received: from outbound.ci.icloud.com (ci-2003d-snip4-11.eps.apple.com [57.103.91.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEEC606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEEC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=manyhobbies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manyhobbies.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=manyhobbies.com header.i=@manyhobbies.com header.a=rsa-sha256 header.s=sig1 header.b=nqExYuXf
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPS id 53F371800103;
	Fri, 30 Oct 2026 22:41:02 +0000 (UTC)
X-ICL-RepId: 01a18ef9-4138-705a-adf8-b80ccabb6893
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAUMGWQZeD04dXwVcEhVdRUcMWkVWH3kVUgNOA10SWxFWHhkIXR0ZHldQWgpcCVEXUQ9eDkFeWhdeTUUID0kZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1UGV0UXwRQElAdQENUBF9QVBFXUAsocTYMO3AuBUYAMwA+HllyXnNdAU0GXRopCjMPTHApAC0GQA04XgxZElofWxpaCERFUR9URhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manyhobbies.com; s=sig1; t=1793400063; x=1824936063; bh=0gIgGhCHm8bEpsZOPji4A4j+l9vAgID+Kd1kyXON6Fw=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=nqExYuXfLJrPoynK9F6P4VbvZ2fGHT7sVifY/wFM5L+HySm/SV/o38zOUBRUc2tCZLb3qjWQ1RZGZg59yinmI7YPy+RpQDUK0r2702bNxy6ZBfiP9Irtgvqm/d/ICVJS5d8EQ+pPI/9aNxjABVPOkW8M5txl/qIn3Du8ePfLsJIBPhF7OCWivUi66pwqRIt5qbGBRaWdJ2PQgIr1Iha2yrfUSy4hezjY5VbwIoc/tqyKWi+NcjWvcSlXny6zkfjajKuqPxzi6RkXnIJ+dwlKxedxNNUnrdQkGnJXmBo6B0J2C17tIp3b/iUiRYDspY3ZcdBaTuCj6kaZqMEUybou8A==
mail-alias-created-date: 1780273699991
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPSA id 54B7518000B3;
	Fri, 30 Oct 2026 22:41:01 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock
 timeout
From: tam.do@manyhobbies.com
In-Reply-To: <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
Date: Fri, 30 Oct 2026 17:40:50 -0500
Cc: Ulf Hansson <ulfh@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
 <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX42Fyqr+Tof5x
 rqVhPO8azEg2A5LW2ESnHeokCLl9ntkDY7jC9hzq36RV7+owLm/MNys1xfWZ1rmBeJSqAQAbsCm
 4ForHBTbHjT5TVtmQWXv4aNaTSnT8lYFsV2iSDVwiLh06CaaUuedek/4JuVgoy7pulWNS/f1RCe
 hK/mU4vAJietBbZ6nxUmeXJ3DYE/vCpJ4Wpc3ZZxUwYhdRx13Pxd7gpip8NdiArrUJb/yIZCsAp
 WtB2QekCxNBYGC7TQQdVPc30kOPia8XDie22rcsFVaXfc9hdyuzqsk/ufZG9b8lGuqJOsykJJiB
 LX7GJ4XCbqmM0uU3JgcXIivalfeoTgwLuQHBopwDBz4PW4gg1GElRS5qXuF73Q=
X-Proofpoint-GUID: 2x_7z9kaaNiPlJQqNqi13Xatg90oQXIf
X-Authority-Info-Out: v=2.4 cv=d4X4CBjE c=1 sm=1 tr=0 ts=6ae51cff
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8 a=EUspDBNiAAAA:8
 a=hnEzuQZJkBTHcMNEFcUA:9 a=QEXdDO2ut3YA:10 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-ORIG-GUID: 2x_7z9kaaNiPlJQqNqi13Xatg90oQXIf
X-JNJ: AAAAAAABLs59V6KwCCAZC5NBGWHf2zFYri/plGG7y3+Q5gp7br6rJx6KqvTkp4DSxXlP9Y
 4KyLaml0R0O0APQwD/pokhEV11lMm43pO17KIoSAHnCWdXfByYanOXMdBVUKOMPyPyTX4f
 mD9ZRwOt5lfFSbj3N2pNQdHClNGOOFkVEWSL91FjXsUp3CGtNa+wiG367dfOxNl5QzPdqL
 zv6YH1ZGTI+pzIXwjgysQInFcKJRva735GA+2XFQR4Mc1x33mMzoEfp7ECXFyzw/Gbzb57
 TDaETMY+TwHB6cICBKFK6D+1wFQcfsVa3blQydPtRn+/WST9HtUURvW6h65wl9BqpqKwvM
 YO5rJDmbudm0fXKn9C0EGORe8L3WVvPUbcsWMTKcMoqUknjv9ctpiF7szqVkuKjHRFc1cM
 08aHV8/ouxjSzJXW206vujYn9k6Z6NuuWjZQFSzPaduK+tNQ1+nBM3hnSw4qF0rrFUITlj
 vqG24OcWeXxAWZi1hdW+skQCzFZslVuwQl6Jg26/KMZRe0dySP+qydZtVs2VbzG0MH+UVh
 cAgeBNXJx8nUKYt3iwx49D1jLHqC4rtA0vf4+QzXcDS0jw+A/gKx5C8plQpDiB+fELNDIG
 9ZnCeq2d9MEXIO7L0wZ1C5hSd7BoR6UJmMvsHwhzx4j0u7uNpRNCS4dgMcWXmMs7Kg5Zb5
 5HvXLPAPHfDXBWpj2isqLlAO1fg5WxFEUuyWQzYIietdqGxbmnQ0lGa5AmakX6BbIhFiXD
 BWqzhRglBxjdiofAYt5kGBb4trGtKqtOcx8+ry+WtrO9lyHVhTXnz6SeSFBREubZP/edF+
 6Ars9ZNUwTd+pl4v27foQN0na+N2aERZatj+q5cKpOx3zW27TnIGA1YtWlwy786V7/nlvy
 4me/MEBFYdV0LdWupRzdh9DR5aNBXhqxksI4+7mrv21dyPI6NXcT8XRyqsqvO+CD6dbk81
 b+VGAQYqH2fOEcBpnHN/kHQYGzXNkDRoxqm1KiUvisO3N6sgNdclInHx0sDoUhMCoyfVBq
 k7xaMDUb2/WHlwPNmbWhlftLr2hPjmC5jODv7n50eWHKTbH7JBnfkSPEJM4JEWiuslcWqm
 ZDIHYxExUlS6jfCssnp2DBmAnl5eYBp7dp7YazaDRhSJvNtXrAt6uY682eskHJexvGSd86
 qynpqTi+TxvMk5xw7aCclxToZi2YaOUtlTRCLVwLC30pDQkUP/1cjgXeWopUt1HUpEo7G6
 3SDS+nmgSFAGhFzqf/O1nleSavTVoS7DStDAEQzc5buucRzB0tYS5IeYFQFE2jk79vXVQR
 CqimGOzOvYGFIlVCDj0255vhUIQpA8Ixbsa+BTS3jak1zuwXWE23JG/9YBUzVg3lY8+tJY
 Ju2n1x/VKUCzmVdTsadlVSUOrY1hm+hC9cF6UeqXgWsRzj9viPm7S68l3+TA+b3t7WNyGx
 V+jBWQD0Rf8SduvoM3yfuwXRXW4554m5Xxz01EaRzlSXOiWzFCr17Of4MlrWxMjYrrK8sg
 X+8aLt9F0hWjqUCbEsBbyP+2G7Jf9jz9Fx1RLTftg0qF9yeG4XLMMGi/7ClNBqPKoVMRky
 tmE5oaO6LkuMySfOkGZuUNsg==

> I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> loop in there that times out. The question is then, under what
> circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> waiting for the SDIO card to release the busy indication on DAT0?

Yes. It's the first update after probe, from the MMC_POWER_UP set_ios:
  sunxi_mmc_oclk_onoff+0x17c/0x1a0
  sunxi_mmc_clk_set_rate+0x1c/0x2c8
  sunxi_mmc_set_ios+0xe4/0x144
  mmc_power_up.part.0+0x40/0x150
  mmc_start_host+0x90/0x9c
  mmc_add_host+0x6c/0xa0
  sunxi_mmc_probe+0x35c/0x478

STAS already reads 0x206 there, before anything has been sent to the
card; on good boots it's 0x106. So the card is holding DAT0 when Linux
takes over. These are warm boots from the vendor firmware and it
happens on roughly half of them.

The supply explanation in the commit message is wrong, sorry. The rails
are up ~20 ms later and the command is still pending at the 750 ms
timeout. =46rom then on every update times out until the controller is
reset. Rebinding with the card idle never hit it (0/20 tries).
I'll fix the commit message in v4.

Tam


> On Oct 30, 2026, at 8:48=E2=80=AFAM, Ulf Hansson =
<ulf.hansson@oss.qualcomm.com> wrote:
>=20
> On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do =
<tam.do@manyhobbies.com> wrote:
>>=20
>> If the clock-update command times out it stays pending in the
>> controller, and every later clock update times out as well, so the
>> card cannot be initialised until the next probe.
>>=20
>> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
>> its supply comes up during the first clock update.
>=20
> It would be nice if you could elaborate a bit more on what goes on =
here.
>=20
> I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> loop in there that times out. The question is then, under what
> circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> waiting for the SDIO card to release the busy indication on DAT0?
>=20
>>=20
>> Reset the controller on timeout so the next attempt can succeed. This
>> runs sunxi_mmc_init_host() with the interrupt enabled for the first
>> time, so write REG_IMASK from sdio_imask under host->lock, as
>> sunxi_mmc_enable_sdio_irq() updates both under that lock.
>>=20
>> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found =
on Allwinner sunxi SoCs")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tam Do <tam.do@manyhobbies.com>
>=20
> Kind regards
> Uffe
>=20
>> ---
>> v3: take host->lock only around the REG_IMASK write in
>>    sunxi_mmc_init_host(), not across the reset; v2 polled the reset =
on
>>    jiffies with interrupts off. The return value stays unchecked, as =
in
>>    sunxi_mmc_runtime_resume(): if the reset itself times out the
>>    controller is wedged either way.
>> v2: held host->lock across the reset (not posted)
>> v1: =
https://lore.kernel.org/all/179307312104.39863.12372814163472848752@manyho=
bbies.com/
>>=20
>> drivers/mmc/host/sunxi-mmc.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/mmc/host/sunxi-mmc.c =
b/drivers/mmc/host/sunxi-mmc.c
>> index fe4c0f6d73f3..55313780d06d 100644
>> --- a/drivers/mmc/host/sunxi-mmc.c
>> +++ b/drivers/mmc/host/sunxi-mmc.c
>> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct =
sunxi_mmc_host *host)
>>=20
>> static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
>> {
>> +       unsigned long flags;
>>        u32 rval;
>>=20
>>        if (sunxi_mmc_reset_host(host))
>> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct =
sunxi_mmc_host *host)
>>        /* Maximum timeout value */
>>        mmc_writel(host, REG_TMOUT, 0xffffffff);
>>        /* Unmask SDIO interrupt if needed */
>> +       spin_lock_irqsave(&host->lock, flags);
>>        mmc_writel(host, REG_IMASK, host->sdio_imask);
>> +       spin_unlock_irqrestore(&host->lock, flags);
>>        /* Clear all pending interrupts */
>>        mmc_writel(host, REG_RINTR, 0xffffffff);
>>        /* Debug register? undocumented */
>> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct =
sunxi_mmc_host *host, u32 oclk_en)
>>=20
>>        if (rval & SDXC_START) {
>>                dev_err(mmc_dev(host->mmc), "fatal err update clk =
timeout\n");
>> +               sunxi_mmc_init_host(host);
>>                return -EIO;
>>        }
>>=20
>> --
>> 2.39.5
>>=20

