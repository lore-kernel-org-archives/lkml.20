Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956388;
	b=RcmkOjClqdDqRxqDnSOFFsICLSVMfUuqZYLF0UlPrpjTbr/qsb/h32wM/hDvZN7TO0Ej
	 NeoLP05qJ1afiX7tI1v41VOAxOoLjDOl4CQdWy9d8Bq8erdVHjFmJDFCKt4HPBJ5p/hB1
	 1Eif4SQn5pi+Q2wIftazGdozlHDxCYOOrEGhBrgSIBgxtBj2EMzhGGqus4zZIy1j85E5d
	 hqJ4ioO7Oq/a6ley2ebGCteak4/h84pQWM1cKzX1jCqwU3MP/CZZB/Ue1Z+rfqNZBe/T+
	 89T2g8Q9ROUHxvTqkZGp5/mGmmMOMvrEbF9gOATej6QQ3hWKKzBcu26lrsEWjP/ttbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956388;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=Znq6cS0uN2nkuyEyPFWuQgwErTPCUHQal/tKcU6i/fw=;
	b=AIG39t+v66TSFJt0qp3fBmKOQGX7e7oeWLrw8JFIIC0No5ZnK8isvEoAM0pXgnw+3j4+
	 HIdbOMPxQU30rcC2kiQfkUr5qHCXrUAOIhU2L54N6/lVO8uZv4L1ans/DqQxXv273o4kz
	 lruzuytYdsNPX+JdVVTTEpRiDZtQYvQVbLI7NC7APCS2QNXVFNKmjez0ZpoUqakTOkdhX
	 Q9N9MF6RJh70S74roEcKDJ++3ILPSGtvNdazMtdXJrxxUeqWFvSymHfoDupc4Y+MKxUwm
	 XziQQr8INgd4r+YrZKXWh91/5UKuUiyNBSqlV01qlJsIUVrcZwQ1mci/YEpeVFf3V4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmqVVWPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB7606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmqVVWPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03C11F008A4;
	Fri,  6 Nov 2026 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793956387;
	bh=Znq6cS0uN2nkuyEyPFWuQgwErTPCUHQal/tKcU6i/fw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=CmqVVWPTfj7laY54cHNeOvPcMUhpm7APTZq3Gnz0ts58uFDGnY/qhU4KBbiTarFei
	 ePZxz9Zx0YUt2KUQ8ID0ePsUL+7gy9cUIHJKwA5Sxc3WS7vvAooBTkAFJAEn/kjq34
	 IL/GYc18x+A7GyaWSBGp2OWY9hCFmEwF+SSTEo2Q8gCvrVSRVKs92OyP5o/nrvmdav
	 HSmY6VGISE+wi/qPhtlI+1rbIdJdFt2ytp56ENRdXddfbqAQviboMStjcHGzc8zm8P
	 WdAEK5ji3s3AnxMwBECPMuOv8vJfYs1bqTudPLhc3WLstIOhS8bI6wSSCoInij+Ti3
	 k4VbDHtIcqXbA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 12952198003A;
	Fri,  6 Nov 2026 04:13:05 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 06 Nov 2026 04:13:05 -0500
X-ME-Sender: <xms:H5rtajAcCU9YDD0R7TQk2cRwb0I7RzcuceklZ70mW6nlXuri9tUSEw>
    <xme:H5rtakX0Ak6_6ApN0ch9xH2I6LY8-x90mGx2j15gCLR9HkM5hmnhtbWIsAWtC7qgt
    vDTaFGdmqiLcGw3eHAW6XsQumYcENVaSsXzdkJKzEvUg1CasxP19mIkow>
X-ME-Proxy-Cause: dmFkZTFZ4vEQcr9AnxghdG2Pkt6HQ4brNOxrnjbl4jc2zkD+YEauAFI2el7yCvdyK1omqM
    9luID6QgzXTOA7pC+9FQxjEwXi6YYTSFHTOzQG1UztD6jekyNfkUwk6/XaM4LAXJ+at/VI
    6srgTgDq6/g9FIyw8ZNUDcZviDWJ8ow7oaoD3jTJKpVUeboYWgIXAuCKqFmggcONzH+O9C
    yQG2y9zA+arayknJTJ8vvAYVbaGC+zQFam93IikfYkzG54Vruza5g+2NKygB3yk+WZjhvj
    jmHxB/cjdqKS509nfsQILz4u5v15WdKgGsk+X1OTsWJP/GCxKnHl9ht3wF/QsaJ/RKl+WL
    8JkV3SxCGgLqSew7P3W6j5gxjbs+cKPYoGErg8dx8p1bNpStFgtnaxF9lkUTsnz5qWq8md
    CPSUc4X/IqxjeffKd7/9LnNGOvIxidikGE3vjBcuF1jAw8I/IZNkrAmFI17AD4oB6Aibb3
    +Rp9AnDCF7uPok2539WHDNWdtIsPWyWiflGKc/PemtkwMcEYhgjRJpd9TBlundweki+UCD
    vBWd5SpqjVEjKcPWZKPVgKOgyki39unuVCCTV+7gvts8OviHa3nAsmew2/I6sk4ig9tsTc
    2XxduUHmUv0VBH6rFyXLM9z1pw95hmNqe+1QWQHDw/Zsa84HRQ/9ywrLRpdA
X-ME-Proxy: <xmx:IZrtatxOttryreUty0Fe_XcNxy9-FIMYj_lkBbzhuWHzjAsGjB1HUw>
    <xmx:IZrtav0b_Zc4FmxItxYBYnxrc4fs0kjaXGK_Mb9qOWdCIChWQxmKqQ>
    <xmx:IZrtaq8NRNg32OMfXy4sIQ0bhD1VuILFmnSBEWKMda-HPsydqgu6Jg>
    <xmx:IZrtavrCJabYt9mHgNMCYpPNFn7edKLqvod99MBjQZssMjwWTHL3bA>
    <xmx:IZrtakTQOLeiqxFh_-8IvofM-fmP3pHW2bsthAGqzUPlrk_EM9l9w_BJ>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2B19DF8008E; Fri,  6 Nov 2026 04:13:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 10:12:42 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Guo Zihao" <guozh23@xiaopeng.com>, "Peter Huewe" <peterhuewe@gmx.de>,
 "Jarkko Sakkinen" <jarkko@kernel.org>
Cc: "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Matthew Garrett" <matthewgarrett@google.com>,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <73a5f412-0962-400d-9e80-5b9eef92bb8e@app.fastmail.com>
In-Reply-To: <20261106014956.4129904-1-guozh23@xiaopeng.com>
References: <20261106014956.4129904-1-guozh23@xiaopeng.com>
Subject: Re: [PATCH] tpm: efi: reject a final events table with an oversized preboot
 log
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 6 Nov 2026, at 02:49, Guo Zihao wrote:
> The preboot portion recorded in the main event log is subtracted from
> the size of the final events table taken from the firmware:
>
> 	/*
> 	 * The 'final events log' size excludes the 'final events preboot log'
> 	 * at its beginning.
> 	 */
> 	final_events_log_size -= log_tbl->final_events_preboot_size;
>
> Both sizes come from EFI configuration tables and are not validated
> against each other. A final events table claiming a preboot portion
> larger than the table itself makes final_events_log_size go negative:
> the subsequent devm_krealloc() can then end up with a wrapped, too
> small allocation, and the memcpy() that appends the final events log
> uses the negative value as its length, running far past the buffer.
>
> The boot path has no way to fix up such a table, so fail the final
> events log instead of appending from it.
>
> Fixes: 166a2809d65b ("tpm: Don't duplicate events from the final event 
> log in the TCG2 log")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
> ---
>  drivers/char/tpm/eventlog/efi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/char/tpm/eventlog/efi.c b/drivers/char/tpm/eventlog/efi.c
> index 4e9d7c2bf..0a8006f3e 100644
> --- a/drivers/char/tpm/eventlog/efi.c
> +++ b/drivers/char/tpm/eventlog/efi.c
> @@ -82,6 +82,9 @@ int tpm_read_log_efi(struct tpm_chip *chip)
>  		goto out;
>  	}
> 
> +	if (log_tbl->final_events_preboot_size > final_events_log_size)
> +		goto out;
> +

Should we add a pr_warn() here?
