Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F73AA9E2;
	Tue,  8 Sep 2026 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899074; cv=none; b=Ed+sqmEhk7E0dSCcuI1suf4FxCBZpAW9iGnlpqGTbusvqj5qL0B9t8dkv8Eo9MCXL+4QSsDIefYWe9nD4NoJ+ms565jAk+lAWeWU4pbbfBhS+WCJmO+iSPX4UMQC6pADqWactF8kdV7gxqNrG8p5EDMf7PuK0grlaLf7l1wheWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899074; c=relaxed/simple;
	bh=34UMiWTgxcFBqUNYh11YSBmRYxGFZiGVkCLTRzlNjdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcfLeWrjauxpQB6KKPZmdWgLpPaN5mx9fLz0yoLnz5YDGV0399Hhms9wiXKYcy75na1Xaag1cwB06rs8Hyz3GpwLOYzqJnsLTnzq4fatMbNFXxvAmd1Uk8oLsKXxN6nuTQXJhiRf1UVEgfiiH0ruZ3LioJD0KZNGPn5qKmPWKqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n13BLIwJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n13BLIwJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FF31F00A3A;
	Tue,  8 Sep 2026 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899073;
	bh=UX81FKHggDlYBKlQeaoEzIUHgB632Ksy7gdLpHI4rVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n13BLIwJUvc/OQ5IesL7KDPLWb0H+mPh8H9Cy3ItVDb5BGON0ikp86TlzyYX7EaHR
	 3ePPwGuAnceTgnPER+uk8XpmI9RTdqctlshgC29YgNuiZoHhZ6cEP+/0mjsHF69Ycf
	 fAzuq0xDMnj/rJWwi0U5PqMfFrXX2cvN5v00YNvIzIxhQ8zWM7c/mhX+QnTAtBBpWT
	 ZU3jSm49HKaF6HjrwQPDrlsh9Iu1Ay1CKpMuvfpXfdKokzTGCbUyAt5OMjwatkpsk7
	 C3IpYx6T0VZoqFUM+e10ISLdebrmDk17Ae3XUifqAczThEmuBjdWAFZsCtA/SO67AN
	 bIxrG97DoV5qg==
Message-ID: <1b51428b-5dcd-4fdc-8f4e-d16ab14426a1@kernel.org>
Date: Tue, 8 Sep 2026 22:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] thunderbolt: Find Apple VSE capability during
 startup
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-usb@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Janne Grunau <j@jannau.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Mika Westerberg <westeri@kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
 Rob Herring <robh@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
 <DL94J88RKZ3S.2EX69YJ6JOX4P@ubuntu.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <DL94J88RKZ3S.2EX69YJ6JOX4P@ubuntu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/7/26 15:38, Joshua Peisach wrote:
> On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
>> Only Apple Silicon host routers have the Apple vendor-specific extended
>> capability. Look it up when the software connection manager starts and
>> store its offset in the root switch.
>>
>> The Apple NHI driver can then use the stored offset when programming
>> cable information without searching the router capabilities itself.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>  drivers/thunderbolt/tb.c      | 4 ++++
>>  drivers/thunderbolt/tb.h      | 2 ++
>>  drivers/thunderbolt/tb_regs.h | 1 +
>>  3 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index bf1c192ec10a..d2832323cc36 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -3025,6 +3025,10 @@ static int tb_start(struct tb *tb, bool reset)
>>          return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
>>                       "failed to allocate host router\n");
>>
>> +    ret = tb_switch_find_vse_cap(tb->root_switch, TB_VSE_CAP_APPLE);
>> +    if (ret > 0)
>> +        tb->root_switch->cap_vsec_apple = ret;
>> +
>
> Nitpick: I *think* based on the surrounding code that this can be
> simplified to "if (ret)"
>


No, ret < 0 is an error and if something goes wrong cap_vsec_apple must 
remain zero and not whatever errno tb_switch_find_vse_cap returned.


Sven

