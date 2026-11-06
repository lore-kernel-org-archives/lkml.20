Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954703;
	b=1HS7NA0cpVVq1L84F3t+S5xz28zdCjwWLBxbJd49/4RRZQex8LOy0j9LZAepq9pPkmUz
	 kNbQAFzW8HfWj3cL7dwKzANMoKpr8A9NcFs4hNdWT79Zdv5YOIoWaLMUwagzya7U0FYMX
	 j3EMvF91ALy8hR4IZuhcu2MvOl4pZ4NaWqRezwTIBjBGmgtJfb8o31eJNgSSEFqM6tIXs
	 fPjqdCb4FWgXYVb2aZrbscYfvD2qTfSmNC/VQ3vmEXzg2b5GWD23+sDGYvamlSdOzZGn+
	 8htNyfZHuEtV4mt81Os/+V/ucAQtLGtU2gzliPSvYm24xBd2L00HLSqxI1xS9nQcIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954703;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=RYBpCrwqIMU7q6O7uLz/uScEPoKU2ymjvQ+Kq/wH0Yc=;
	b=itMyYH2ytRWXaaO+KIAcUb4ci4Zw4+zXy3+3BmMhHIuVMmcFcmJIcecT+BNwkNwcgQhd
	 tzymmsM8ol14Mf0qtf4+//WOPOq3LWIQ0oESjbifh5K/N2r8kCy6bVzktJXEQ6tUHDD3v
	 CFBAdictZmK4PJv6oSAQDtCSFSUqAMjkithlXISU5S8y3+biIUTpK9WDbtLhk2IWzwzAS
	 RZ+fw50bF8Oi4kM4HobSXozsR/WQm6v55DVfZ7f+rmcaTR+UEwIJLV9AUBixMdPJYdFgy
	 7/4CAEkokticO0pMvBAGlwX8oLHCbWDpxluJcdX+/1TzfHH6ulH6t/4ISbjp1oNkJmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=hCR6vCEo;
	arc=none smtp.remote-ip=62.149.156.132
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B9606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4B9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=hCR6vCEo
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id PFZ4xiX0VV5J9PFZ7xlBoE; Fri, 06 Nov 2026 09:44:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1793954693; bh=FaDkewaz141YmaONaLecraAwnXDneRnUvwqofrzM8dU=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=hCR6vCEooKlk3xKSm591BfadgFuCEzn3Bz+1hBBeG/I7b8RDjTKfq33oUfZl9gWt8
	 fBa0OrlgqbAfgsWLo6HNcltnf0sdnPDfPw+HxwkOPVOcQBu4GMlhAoSR44hTGoyP4e
	 940eejX2X4990NYHUgcAK6KTkcrvRZmysgHhOpEgZcYF3OT8X8lSZ3XmlCf0U9U+jH
	 SpJri2iaDwmBFv6PnJFHklyz8kMcwSnkIOB7dZKSf5i+njsyJyt2G4U4xzhpdQyskw
	 8ncabORBhpTaS7ib3dB8AwLWG9DD9fKxiNCfj6o36qXRMK+uImxhiOLVUUwhKN2nSp
	 yhyFqC9kV7eoQ==
Message-ID: <d76c4e6a-3411-4497-a07d-44d8e77e1904@enneenne.com>
Date: Fri, 6 Nov 2026 09:44:53 +0100
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
Subject: Re: [PATCH v2 5/6] pps: Always use ktime_get_snapshot_id() for
 pps_get_ts()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Jie Wang <jie.wang@intel.com>,
 Yuan Wang <yuan1.wang@intel.com>, Ryan Luu <rluu@amazon.com>,
 Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org,
 nh-open-source@amazon.com
References: <20261106030856.2538039-1-dwmw2@infradead.org>
 <20261106030856.2538039-6-dwmw2@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20261106030856.2538039-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPW/I8XBDrfHyZzBuONZT4i5kT4YEzmpd/OopLHxwVZnnXF5btE0Z/KbIO1/G8uJlmApGwE3cLqRi+Vi+mUcK6ML3ef4pL6QcKm8N6rR96miRRJ+MiV6
 a+UbGF087WDs9jzJzKpWuEOMKAnax+3HxdAIDtMkyvrJj201mg9yKrLbTglVEjQ0x3OjiWX1vqJNWfqHzxqPT3mfhFAFdSe6aRZAvDJcz39htSxW/78wf20o
 nXrT1E85bbSKv8I0VYccuMUkzb9cbZEXIDU/d+rk7deKanRo14MaiPILM6Yz46TKIj2eP2foFKkOXiXyfI6kdPi9Nbhfhjb5jA3GEmNdb9vaVpajDOjhDKjt
 bQjwITCWc/s7eIJ+3ifrhU+i7cs6fglkpuSRwspHVw/zRzAUXIvTmAcT6zdAAdnJ4AOqcAQvr+FwDq7D3ifjw6qUukDY9y8FIel2xQy5ubP2FH1h9GTarA7i
 co695+9JgQgjlAl2lbMf2TuQQVN8ReSuGsElCTrprND56CkZ00lST3CiE6NIKnSHbOhMGLYU3I+ceXlr

On 06/11/2026 04:08, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Without CONFIG_NTP_PPS, pps_get_ts() fills in ts_real with
> ktime_get_real_ts64(). Use ktime_get_snapshot_id() unconditionally so
> that PPS timestamps always come from the snapshot machinery; only the
> raw timestamp remains conditional on CONFIG_NTP_PPS.
>
> This is preparation for the next commit, which corrects the snapshot's
> ::systime for the accumulated ntp_error. That correction should reach
> *all* PPS consumers, not only those on CONFIG_NTP_PPS kernels.
>
> The cost of the snapshot on a small ARM board (Cortex-A53, 12.5MHz
> arch counter) is 38.8ns from the pulse handler to the counter read,
> against 23.4ns for ktime_get_real_ts64() — both small against the
> ~2.8µs measured from the pin edge to the handler.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> v2: New in this series, ahead of the snapshot correction so that its
>     effect explicitly covers all PPS consumers.
>
>  include/linux/pps_kernel.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/include/linux/pps_kernel.h b/include/linux/pps_kernel.h
> index 00b840970d56..35d6ac06a0c0 100644
> --- a/include/linux/pps_kernel.h
> +++ b/include/linux/pps_kernel.h
> @@ -100,14 +100,12 @@ static inline void timespec_to_pps_ktime(struct pps_ktime *kt,
>
>  static inline void pps_get_ts(struct pps_event_time *ts)
>  {
> -#ifdef CONFIG_NTP_PPS
>  	struct system_time_snapshot snap;
>
>  	ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
>  	ts->ts_real = ktime_to_timespec64(snap.systime);
> +#ifdef CONFIG_NTP_PPS
>  	ts->ts_raw = ktime_to_timespec64(snap.monoraw);
> -#else
> -	ktime_get_real_ts64(&ts->ts_real);
>  #endif
>  }
>

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
