Received: from outbound.ms.icloud.com (ms-2004k-snip4-5.eps.apple.com [57.103.74.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88835C185
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188153; cv=none; b=hqIi4WAhBbocLV+gL2jbEo5v9lo3ZFnou8Cr+vl+DjwLjuG0jWrGjc6TvjS3TBUfXnhOHh3uLwon7wcVSgMJfHW2S/VlmnUHhiNNhCTQ6JaaQcO7hCiINgTWsB9m6IQHCEPywF9R8VSVk9wEEIJnI/dWJ8fw+q3zAs3hyeTgkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188153; c=relaxed/simple;
	bh=ql6nD8jjUHofs2j5B+YAjajTgb1xVq27Du8E/O8QWI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSeYd7KDH0tOdYGS6ydzn0GwiOS4xlWNbu/D8NwCkg74+pAxbV2K8UrUPFXT18OVOSBAWX9Od3LRji8g477aUapzg7JlUDxzGbfMb7psgcZqtU1z8J93fsnvOg4Z8gDMKF7lWpfDltdS933QVe+kwASLdnsZZxjkbvEkP3NcHqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=DSdcCq1Q; arc=none smtp.client-ip=57.103.74.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="DSdcCq1Q"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPS id 82C981800355;
	Mon, 05 Oct 2026 08:15:47 +0000 (UTC)
X-ICL-RepId: 01a10b22-1c67-7000-b57d-931cd80d19f9
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBKHVwPXxxBDUwdXAZdEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDlQXA1ccVkVcGEMJXQVXHB0AREVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ9fB1kEQQlIBl0PWgdCAFYHWAFSBV0IVUMEUhlAFXkIWgNYBQNeXwoNTUMSQhUEG0YeQwRfL10XXgxeBQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1791188149; x=1793780149; bh=L9uLoOBTD9w1t1qUvTjFgamb/kOBtGPS0KtQvW60OSY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=DSdcCq1Qo+QoBhR9qXcHsyNdqqnOti6bOyqU+GLw3XXUObYLYh6pjydodn7gMcW5msgq7/qHMH89iM3mfQXoigRxPUWucUPeoM57P7e+cnkaZnHYM2uqdU0bBezcsMesZDrPXG03vnut9PfMqa9lIm05/WDuHIunBYARYfDo91g0foKUQ5W5Lpnlhz75KnQlGgx0edB8eXy/zgOKsHxBmoAH51aJ20SjVQ0Y8FlsBumewiuombQkVewzbMblxwIvF7Elye3T7442yQ8wPg+hx3qIkKTPpQwywsgJTo3sW4Bd6tN2CHG8qa+o1ToewtLC7kXi9UhXdCEm6CK2NRz52w==
mail-alias-created-date: 1575045973000
Received: from toolbx (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPSA id 87FB618000B0;
	Mon, 05 Oct 2026 08:15:44 +0000 (UTC)
From: Pierre Pinon <pierre@pinon1.fr>
To: okerixx@gmail.com
Cc: hansg@kernel.org,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	pierre@pinon1.fr,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] media: i2c: ov08x40: Implement get_selection
Date: Mon,  5 Oct 2026 10:15:29 +0200
Message-ID: <20261005081529.45697-1-pierre@pinon1.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179096167726.2508.10599420708324219706@gmail.com>
References: <179096167726.2508.10599420708324219706@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _wGdSyeo90-Lf0E4K9-Xpy2mt9W8BmPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMiBTYWx0ZWRfXzzUnNAmr3Iy8
 UxTz7/MHwHFem0JbpGjg74EdUothEy9Z8il0vMheI8G/YZ6Jhx3fn1sjWSlqXqT7TfBUQP2dq62
 F94m7rjqDdJZtwHnsV/9BcpM8igPD/4BSsa9hEgmzEDwCLv5Tiq19o2LmmsTv0hxoA+XeJ/OBdG
 vMCE42v67UG9mc+UhoJHT+WpDwdKmhgw5gLpNqUCea3xKX42O6QG4CQIWna6T8jVsMn5ox06lPY
 hdxsSTB/XMYoko7BEsRQ4T3ZJO7tO7+znREcZACVtkwRnsBr6Y6izfeKrNuVCovqqn6i4s2FeaU
 49Py4LRqg96gvnnjRgdeXu61iX/1TpIz/H6oSSRMF5hqnEXAaZOeiCpNzrAAIs=
X-Proofpoint-GUID: _wGdSyeo90-Lf0E4K9-Xpy2mt9W8BmPk
X-Authority-Info-Out: v=2.4 cv=Y+v1cxeN c=1 sm=1 tr=0 ts=6ac35cb4
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Cl8kbS0eVb9THYje38kA:9
X-JNJ: AAAAAAABy8DTSxHgvZO59cEsTWJAbEdyCxmQEuJSHMckWS16jams2NRUg+ATLDC/EURyf3bI8m/UL/HV0iGNkzfLluDquEb9ZgLi9tyBBVaD7Qa4dHsfkzR9u0B1VKtTk1AiKomdtPohlcCtYNLwta+wvIbDPy90Y4n7jD5F+7X7Pqaq1e4LlYQM0neebX/5sFCTO7bdg1FA1+XLR/aY9eGnZ69gQLtR6h8WuxCbp1G+1BTcZGxGS8X65lbWImcgRpAIBwyscH9Yj7nbjInKzGKqlQ9f1iDqWZ3WhVoeEEvIu/yh//RmOVs7ZSvBw13JNRu+SJM/uZIwYZ16R+XzTfCDAW0RVG5TfgngnfVj99spBikEX/nZKrbS1fLkWav1WmeQGws/b0BvGsINLCgh6uZCdLIjOH7DCe7m6nb4W20KcgsbufVTQ2Ibkn76rMbi/tj3uPot5/yN9w5vAlIUBLEn91yTeVwTVSaCGYOKApN8FMdPQ07wMhV7d/lBIBq/nmFi3+sQkyV0UAn8iFSP41+yXLEtCDiaotg+mYrkcu3vNChk9VwDfC4hWIvmyF+ZHWa7DAorYSKx90rxTfZy0k16t1zhSvFbeMhmgQUNa3+ITWXQjcB3HhBkel9YtmllFgzU0e6JD/xOqaTzQSQc9BrjkYWAMBTk2ySxtW00UISL3MkvgorpEh1KxZhsqCOxoRhahUjBU8/sUU4ePgHkPtMU+2SrtDMvo7SOtlsDszPovW2jhY7uQ+QFXtTatOCtiwocGoJ+3ulDZwG8H97PhwU/kUc0HhbE7Rbaw27XvhdxEgR1K9Jo20Lv7/XAPcsuVEFZhqoxE5Qnjy4GEFa61QnqQgRsUrsZx/9OrTNaqa7/Qo+jorzIqA21PuZRoN8W4uSxrUlL18Tq8Qy2d9NXJn3tvtKb9TVEy542dneqhTWSM9ikBxX8SElY/1C57/jlQPuq19Ohlf8+6fT6t5Re+G4Q7xOlqF8
 N8/fZJKe14O5D2qpIygt3gO0c+b8K5+PubjMSjpEM322byl1elQrzgcHwOcPHDBFGKYR/BvGF7essAEHBAGH8BKb80WyM2LdKlr37d6jrp3MNWVv8mSRd3bGdPnA9lLJugkTlSn7b4aLQ74FRm/fCtcosZVlRIXCESb4GcL8fvildFC+SGzDOw//fU1ZjdrRtCShmpl6zLNkaL9CxYX2tr9EWx5gagUepINm1DR2aZUFIEkWyHzyaqr6pen8LfNeWZ8TH1jem/txqJ6SOppzPYHEJ+Or60FxxpACz3SpGctuR4Zg29HufDw8LxesOGV9PEWDohGPlGJ22eHKLzVX0Bv7ehhRQf1tbJr0jg+5ERA==

Hi Oleg,

On Fri, Oct 02, 2026 at 07:24:20PM +0200, Oleg Keri wrote:
> v2 works here on the Lenovo Yoga Slim 7x Gen 11 (2-lane, libcamera 0.7.2
> simple pipeline).
>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11

Thanks for testing!

> Yes, please do. It makes no sense to default to a mode a 2-lane board
> can't use.

Sent here:
https://lore.kernel.org/linux-media/20261005065535.16137-1-pierre@pinon1.fr/

For the record, on the Dell (IPU7 behind an Intel CVS, 2 lanes),
libcamera now picks the binned 1928x1088 mode for 1080p, and that mode
still does not stream: the IPU7 firmware rejects every frame with
INSYS_MSG_ERR_CAPTURE_HW_ERR_BAD_FRAME_DIM.

This is the issue discussed under v1 2/2, "media: i2c: ov08x40: Do not
expose the broken 1928x1088 binned mode":
https://lore.kernel.org/linux-media/20260904134604.595685-1-pierre@pinon1.fr/

In short:
- Jimmy relayed that the CVS firmware decodes and re-packs the sensor's
  MIPI stream, and only supports 3856x2176 linear and 1928x1088 sHDR,
  while the driver programs 1928x1088 as linear.
- Sakari suggested having the CVS driver reject the other sizes.

With your Yoga feeding the sensor into CAMSS, I assume there is no such
vision chip in between, which would explain why the mode works there.
Is that right?

I'll follow up in that thread.

Pierre
