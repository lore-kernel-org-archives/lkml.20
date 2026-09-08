Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24578F2B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879376; cv=none; b=QMAgnNtO2Q/8En9KGPbRtLtgQHFE1FcvoDiY0JKPmZBjDbq6LceIMzm1ZrJ5yBaqiCnPcM5o9YFS3UqDOvgIteb5hYwifMVur6sBEL2zFZBm9AdNC1Xs3gJ/oU7ZvYiKyjzPMIfcGQH9sQNbv0ojxD76FUJrti1Wc/z9gMZaLI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879376; c=relaxed/simple;
	bh=jqT5YWw6XzYTW3RmB9nMK1Qe9ifvJJ0493veblNOzns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDGjNxT7woi3HRvrRDfYjDQf7zth/gZw6NDcXDBvAyvuxYldcNiaD9hFxT6tdwGjzBSWyU0JZVk3fzpRGgcnfLHezH3luSCm/xewK/oR9akzy5PXH6C5K0Z3h630VwYrgTegam70tU6NTJblNVgRsUD2aWPipiNa7irtufWf7Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WAUEc73c; arc=none smtp.client-ip=91.218.175.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WAUEc73c"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jqT5YWw6XzYTW3RmB9nMK1Qe9ifvJJ0493veblNOzns=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788879364; v=1; x=1789484164;
 b=WAUEc73c3Gi0aNrxu3242M86092fDLCu5QOWiRikIiAOzNnFG0ai4y5c8s/r3MywFucXifoe
 TMwoDKkGRCvZlRqYq1hwiwjOAxho1pwJXxCJtI+0eWH9CBVwvBxXtO9SPAUs5quIPMf+b6tXQqA
 493lUOmFZTHiM2xefvskls7k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f0ad4095efbec7d0;
	Tue, 08 Sep 2026 14:56:04 +0000
X-Mizu-Trace-ID: f0ad4095efbec7d0
X-Migadu-Flow: FLOW_OUT
Message-ID: <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
Date: Tue, 8 Sep 2026 16:22:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
 <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> That's why the current series takes the lower-overhead path
>>> (mechanical transcription in C) rather than proposing an intermediate
>>> DT format as part of this submission.  If the concept-DT direction
>>> gets traction at LPC 2026 DT MC, we can revisit.
>>
>> This part I follow slightly better, I would be happy to proceed,
>> pending reviews with the current approach, although if Pierre
>> is or not probably remains to be seen.
> 
> @Pierre
> Please let us know if you are okay with this approach of C structures.
Now that I have more context, I don't have any objections with Srini's
proposal. It'd a good step forward to use common class drivers across
multiple vendors, we'll probably find a couple of bugs or harden the
SDCA core and that'd be good progress for everyone developing or
depending on the ASoC/SoundWire/SDCA frameworks.

If this means that in an intermediate step C tables are used, that's
fine with me. In the long run, things might change with additional
options such as:
a) ACPI support on all platforms
b) DT hybrid mode to reuse ACPI/DSDT tables
c) DT native representation of properties.
We can review the preferred direction when the platform firmware
plumbing improves.

I believe the point about binary/opaque data was noted by Srini, it can
be handled in multiple ways and there's no reason to block.

Best to start small at the SDCA level with incremental changes later on
how to fetch DisCo information from platform firmware - that wouldn't
change the system behavior, only optimize by making the translation from
DSDT to C tables un-necessary.

