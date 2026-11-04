Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818179;
	b=WaIVosCknTZkV8nasTd5hvhD+Zwvh/97zn+blvgh6/KMJc9lQQgFtpERIO3M7ZmPysG9
	 3CxlHudOzXplLxXJbiYd9YjYyNYqCjc5pV8ar+IkFf/C/Q/Zny6ijypOBzBiz8jmaDLoM
	 1X6ITjBEveTVVb+pMLAVC1k1GpVkwtPQOGwEo2q0RyzavltrnbFMcPWD+Nt7qoQ96HJyS
	 gbzFFBZ7Q9BqB+bLw/0beqfxjLlJsXxwjAxximMsay6iVcZhnuMO5/FFkqIE2GtIgmulh
	 56RcWShwdLbuCCL1ouhUr/XTeLc7C/5dI/cJb96BsIXK0tdFjvcFg5jRwIYj4RUGnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818179;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fI85vAqYuWNA7MV3jVDWZkWavCE+oxMj7opuSYnLMCM=;
	b=XiWbToJsAr00eepvhT+WaOZh9qh1NG+vli8lLps3ZwoXuhbqnl1Uz/wGnCRxCOw/rFrQ
	 rrfIMBu8KEc/T9pihazrnI4UI+HSODgkpR1uo90L+QAD7+hT/yRD6WH4/Ik6nKTJWr1HH
	 lOqBugTYiMkrumGIKaswrXeP+/H8el9SW7AfTEqq5e9xKwGutEHON5sLgju5npqdsKjIg
	 NvfrMmjsx26veeLcIjHGARwrXSXXkhKFSqMcT0lEgZ6vCCixFjbEsrP2Lb4aLr/VJRTED
	 WlbMZZ3VUtCeuA89BaOm8VvMRYFu3Iaw3rPiLb9o1xsq5DmMTgft4KtlX0M5PWQ/4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W25t+jiq;
	arc=none smtp.remote-ip=95.215.58.153
Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A5606D830
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959A5606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W25t+jiq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HrkTPlINi4Gb1Vr+lJ4Ie6qyY7whqBS7aKFXyHzTpgY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793818176; v=1; x=1794422976;
 b=W25t+jiqtYd2ti98tM6qsaJWH04nMgWCO7ijkc6PsJcPgROLpBvfvk2jrdMrVI9u9wiaIIGI
 fGxBTZX0DPxPT1PJay38OtrEfFZHBBels9uh8ZoQ49mftRt+4ZX52iQU7NsNmHhlpvPEOnxHhju
 FzM/TPjd27ftpncVZv2DgUzM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2eb77902d6d3772;
	Wed, 04 Nov 2026 18:49:36 +0000
X-Mizu-Trace-ID: a2eb77902d6d3772
X-Migadu-Flow: FLOW_OUT
Message-ID: <1f4c288c-63c4-444b-94ea-c77f7d1ae30f@linux.dev>
Date: Wed, 4 Nov 2026 10:49:33 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-pci-gli: GL9767: Wait for UHS-II PHY before
 LPM
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Victor Shih <victor.shih@genesyslogic.com.tw>,
 Lucas Lai <lucas.lai@genesyslogic.com.tw>,
 Ben Chuang <ben.chuang@genesyslogic.com.tw>
References: <20261021233313.247155-1-matthew.schwartz@linux.dev>
 <6ecc7b5a-cb05-440a-b13c-8885bdad34c9@intel.com>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <6ecc7b5a-cb05-440a-b13c-8885bdad34c9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 3:13 AM, Adrian Hunter wrote:
> On 22/10/2026 02:33, Matthew Schwartz wrote:
>> sdhci_gl9767_set_clock() re-enables low power negotiation right after
>> releasing the UHS-II PHY reset. If the bus then goes idle before the
>> PHY has settled, every SDHCI MMIO read returns all-ones for about 250
>> us. sdhci_uhs2_interface_detect() takes that as IF_DETECT and LANE_SYNC
>> set, so a UHS-I only microSD card is treated as UHS-II. The attach then
>> either fails with "SDHCI_UHS2_CAPS_PTR(65535) is wrong" or, if the
>> registers come back before the CAPS_PTR read, runs DEVICE_INIT 30 times
>> with a 10 second timeout each and delays card detection by 5 minutes.
>>
>> Config register 0x8CC reads 0x2000 from clock enable until about 250-300
>> us after the PHY reset release and 0x1000 otherwise. Poll its bit 13
>> before re-enabling low power negotiation. The register meaning is
>> inferred from that behaviour, and with the wait in place 12 of 12
>> UHS-II probes of a UHS-I card correctly found no UHS-II interface.
>>
>> Fixes: 27dd3b82557a ("mmc: sdhci-pci-gli: enable UHS-II mode for GL9767")
>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> 
> One comment below, otherwise:
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
>> ---
>>  drivers/mmc/host/sdhci-pci-gli.c | 29 ++++++++++++++++++++++++++++-
>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
>> index b55618566d651..bd383918d27c7 100644
>> --- a/drivers/mmc/host/sdhci-pci-gli.c
>> +++ b/drivers/mmc/host/sdhci-pci-gli.c
>> @@ -205,6 +205,9 @@
>>  #define   PCIE_GLI_9767_COMBO_MUX_CTL_RST_EN		  BIT(6)
>>  #define   PCIE_GLI_9767_COMBO_MUX_CTL_WAIT_PERST_EN	  BIT(10)
>>  
>> +#define PCIE_GLI_9767_PHY_STS			0x8CC
>> +#define   PCIE_GLI_9767_PHY_STS_UHS2_BUSY	  BIT(13)
>> +
>>  #define PCIE_GLI_9767_PWR_MACRO_CTL					0x8D0
>>  #define   PCIE_GLI_9767_PWR_MACRO_CTL_LOW_VOLTAGE			  GENMASK(3, 0)
>>  #define   PCIE_GLI_9767_PWR_MACRO_CTL_LD0_LOW_OUTPUT_VOLTAGE		  GENMASK(15, 12)
>> @@ -1190,6 +1193,27 @@ static void gl9767_set_low_power_negotiation(struct pci_dev *pdev, bool enable)
>>  	gl9767_vhs_read(pdev);
>>  }
>>  
>> +static u32 gl9767_read_phy_sts(struct pci_dev *pdev)
>> +{
>> +	u32 value;
>> +
>> +	pci_read_config_dword(pdev, PCIE_GLI_9767_PHY_STS, &value);
>> +
>> +	return value;
>> +}
>> +
>> +static void sdhci_gl9767_uhs2_wait_phy_ready(struct sdhci_host *host)
>> +{
>> +	struct sdhci_pci_slot *slot = sdhci_priv(host);
>> +	struct pci_dev *pdev = slot->chip->pdev;
>> +	u32 value;
>> +
>> +	if (read_poll_timeout_atomic(gl9767_read_phy_sts, value,
>> +				     !(value & PCIE_GLI_9767_PHY_STS_UHS2_BUSY),
>> +				     10, 10000, false, pdev))
> 
> Doesn't look like this needs to be atomic

Makes sense, will fix in v2.

> 
>> +		pr_warn("%s: UHS-II PHY not ready after reset.\n", mmc_hostname(host->mmc));
>> +}
>> +
>>  static void sdhci_gl9767_uhs2_phy_reset(struct sdhci_host *host, bool assert)
>>  {
>>  	struct sdhci_pci_slot *slot = sdhci_priv(host);
>> @@ -1276,9 +1300,12 @@ static void sdhci_gl9767_set_clock(struct sdhci_host *host, unsigned int clock)
>>  
>>  	sdhci_enable_clk(host, clk);
>>  
>> -	if (mmc_card_uhs2(host->mmc))
>> +	if (mmc_card_uhs2(host->mmc)) {
>>  		/* De-assert reset */
>>  		sdhci_gl9767_uhs2_phy_reset(host, false);
>> +		/* Low power negotiation before the PHY settles makes MMIO read all-ones */
>> +		sdhci_gl9767_uhs2_wait_phy_ready(host);
>> +	}
>>  
>>  	gl9767_set_low_power_negotiation(pdev, true);
>>  }
> 

