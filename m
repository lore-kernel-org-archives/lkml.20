Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330715;
	b=tsbgGgQwyA79It4NstU2/37HS22lh13Nz8+HYBnYpfJXhir/S5Yz9araGHx7HTLe/+uq
	 LOqN18EZ/CJ2/P32zkA5+6pvjUYZNChj3GzjUP/6V4UPiehctRPGAQ4TnD09yJ5WK9TWg
	 K9X811APw6AJSGHDMq0cuF6L5they8HDQwKRaMCovbVX+nZZPvGKbobXoHUFSMmd2yWJC
	 K0gz5isI4X+pknG2kMdexZ73fDgdvUGjVB4Ct7xbg8jCaSJY1XW3CAcM3pSk6HYAUzXlG
	 5fiO6FJZn2pCYrWLth1NrlnkkWHga6edf2P+wQCgj/cvDvbVe8ktoxHJlVho4DJMEzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330715;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LTPySxtRP1mhuGtp2d44lAr7HZtRbwcpZz5yzjK7Fyo=;
	b=J0zbsgUtv/9tGNY6Phgu3+dHBu+MS/WP9yai8aO2D/AT0Jhm25p1DOxKlcI7cmnIFJOW
	 Ev+wKHYSGzATVH3IdlNveTijK1eDWn1zdnabIAQCC+FHG/we8WVSc/j9YPnhI6IEgRmho
	 /O8a1UZ1+H+h+05fnoOHHBeabR2a+bYikxOhoEtKYbUYByghXmTMP/Vy2IkizoubTH3CL
	 BoakzwKGLZQE87SdcMS4KdcCFWoJnt58yDGNJyC7FUwz75Fq68EI3HRkLpy5FR8MlnAlV
	 DA4KwonFamMHsDBA9fuL7xaiewIw4GkNa6niboE55GXQ5dMZ8itF02szOt82MR+pOTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.206
Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X4P8M2eL1l7eNC5yn66sPQqhZZRuCsoALzO5XvMzrMc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794330702; v=1; x=1794935502;
 b=cRd+TMqixPjos+3x/CzF5ONymZR3b06vCkzI7IGn8mSxTU0vI2tFTYdvKsj8LHGYA1RRs7W+
 JbXVTmZpxpVXDcKRquVcL48bWm9UqAfH1nhCLDizvLJW/9nejuyxc4nVlLnm+1e2zerePQthuIA
 chE+DPkPNlG+jRdBwObfjBsY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2a74a0ee3b8deb9;
	Tue, 10 Nov 2026 17:11:42 +0000
X-Mizu-Trace-ID: b2a74a0ee3b8deb9
X-Migadu-Flow: FLOW_OUT
Message-ID: <c477aed9-6b9c-4db1-8549-e1a407f55e43@linux.dev>
Date: Tue, 10 Nov 2026 18:11:13 +0100
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
Subject: Re: [PATCH v2 2/2] soundwire: Assume default maximum valid channel if
 not specified
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
 <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
 <105b2b77-7eb6-4b96-821d-51af94a2e21d@linux.dev>
 <avMziZ9tYT5lg0Oa@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <avMziZ9tYT5lg0Oa@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 16:08, Charles Keepax wrote:
> On Tue, Nov 10, 2026 at 03:30:43PM +0100, Pierre-Louis Bossart wrote:
>> On 11/10/26 12:38, Charles Keepax wrote:
>>> +		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
>>> +					 &dpn[i].min_ch);
>>> +
>>> +		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
>>> +					       &dpn[i].max_ch);
>>> +		if (ret && !dpn[i].num_channels)
>>> +			dpn[i].max_ch = 7;
>>> +
>>
>> this works, maybe with one possible improvement: in theory if
>> "mipi-sdw-channel-number-list" is defined one can ignore the min/max,
>> the two approaches with the list or min/max are mutually exclusive.
>>
>> Something like this:
>>
>> if (!dpn[i].num_channels) {
>> 	fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
>> 				 &dpn[i].min_ch);
>> 	ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
>> 					       &dpn[i].max_ch);
>> 	if (ret)
>> 		dpn[i].max_ch = 7;
>> }
> 
> I am happy to do so if you feel strongly. However, the spec
> doesn't really appear to rule out both being present, it does
> imply that the channel list takes precedence. But given it
> doesn't rule out having both, I quite like parsing both and
> allowing the driver to make a decision about what to do with
> that information.
humm, the wording "Conditions: If Property mipi-sdw-channel-number-list
is present, then this [mipi-sdw-max-channel-number ]Property shall not
be present" is pretty strong.

I don't mind keeping your existing code but then we'd need to add a
comment to say that we discarded the 'shall' to cover potentially broken
cases.
