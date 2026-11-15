Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764706;
	b=wE284pAlLcB2j7bYyLV6itEP6hUDp80Rmh9aDBg8dshWAltGyym69Vmlp1iTn9/3gv4o
	 YSqiDnyWO1aL2LRME6AlqKuCIPoW2LqsVRH//tH1TfpGUsJI2cJJdalzetYz+D6DhY56m
	 nfEFvmf3DAKpiYsUQUe9yiDQ9FQFKpr2ZLieIy4lG1ghWRCvqiDoOLTHr7F4+UUAyL1XM
	 UxloA7Sx+ElsANqXaNQYIBeSFnA3ZzS9nRU/3kGsxIysH/q3MeNAwN2fYarwLRNqr/fVS
	 CN57etIamwffAQAJHwUyngJnxY19Gmm5aw0nxSKTbwVWplckI9VeXqoKr08OGSwQnNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KRCwRSptRkq/AkraTSnRrsWlI/YJOnIxfj85EB+hAFk=;
	b=s5UbqRiQmtahI2UR1lLvHvW18uOtvvQ3Eq8u4j6q+qWkVU1ZE0ZuKiM6JH5p2gwqWnRa
	 bTm9AEEdUxBt/oPTt9FrLgkb98+qjSuEsO0QHEOkb8IHOJvC6R1Ww4wE3yNlTqovDaESs
	 gV+j07IQ7oIPlsSSMelbVQkHe+7UjxxY9ju0qWz7oRFyK7ybxQp6omJFrEYRJHGLbRblC
	 267H5Kx9RTlGKsbCfsbi/Ts9P1GeNZaAepCaLubcGe5VQK1AtGtjdes5VSrwAQK01q700
	 GihEjO3KRuvl86akExg/+K2EdXTgvYl/2TrbybciXy26vf3DdTDkXVG5TbJHBntaF2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rPYw2Add;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EA606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8EA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rPYw2Add
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=16tNpY8DUbsH9P3tvlWtr4MKCifcBRfF9iGZejXm3r4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794764704; v=1; x=1795369504;
 b=rPYw2AddrTCNPUlx15jiHpsajv0V77rDHLVEJR7r1/tKXMwB9vDaHm8BSV0W+JvrAj6G2hkk
 BLDXVdTVb5aTM7HVE2K4iH0GANUloROfsgoM3eM60tfULkqkpqlE2OFf8uMSnWVYCM8r6QxsP4h
 7yqsKQ4Nkn02f3Ysu7AwWJNM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1cad3c8c69d829ad;
	Sun, 15 Nov 2026 17:45:03 +0000
X-Mizu-Trace-ID: 1cad3c8c69d829ad
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 17:44:58 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: pmenzel@molgen.mpg.de
CC: atomlin@atomlin.com, da.gomez@kernel.org, dmitry.torokhov@gmail.com,
 dsterba@suse.com, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, lucjan.lucjanov@gmail.com, mcgrof@kernel.org,
 petr.pavlu@suse.com, samitolvanen@google.com, swboyd@chromium.org,
 terrelln@fb.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_module/decompress=3A_Use_s?=
 =?US-ASCII?Q?size=5Ft_for_the_zstd_decompressed_size?=
In-Reply-To: <20261115145559.262878-1-pmenzel@molgen.mpg.de>
Message-ID: <D6BEFB3F-B86C-4483-9CD4-D45C85ADE338@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 15 November 2026 14:55:56 GMT, Paul Menzel <pmenzel@molgen.mpg.de>
wrote:
>module_zstd_decompress() returns ssize_t, but keeps the decompressed
>size in the int retval. Output of 2 GiB or more becomes a negative
>value that is not an errno, and output of 4 GiB or more can also be
>truncated to a positive size smaller than the pages mapped to
>info->hdr. Declare retval as ssize_t like module_gzip_decompress() and
>module_xz_decompress() do, and print it with %zd.
>
>The Sashiko AI review found the same bug in the proposed LZ4 decoder,
>which is modelled on the zstd decoder [1].
>
>The x86_64 build boots in QEMU/KVM, and finit_module() with
>MODULE_INIT_COMPRESSED_FILE and module.sig_enforce=1 decompresses the
>237 .ko.zst modules without error.
>
>Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
>Link: https://sashiko.dev/#/patchset/20261113144233.193782-1-pmenzel@molgen.mpg.de?part=1 [1]

Closes: and Reported-by: sashiko ?

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>---
>
>Notes:
>    Claude Opus 5.5 (Claude Code) noticed that the zstd decoder has the
>    bug Sashiko reported for the LZ4 patch, and wrote this patch and
>    message. Tests: W=1 compile with GCC 16.2 for x86_64 (Debian config)
>    and i386 (tinyconfig), both with MODULE_COMPRESS_ZSTD. Run time: the
>    x86_64 build boots in QEMU/KVM, and finit_module() with
>    MODULE_INIT_COMPRESSED_FILE and module.sig_enforce=1 decompresses the
>    237 .ko.zst modules of a laptop's boot set without error; 223 load,
>    14 fail in their init for lack of hardware, as with xz. The bug itself
>    is not exercised; it needs a module that decompresses to 2 GiB or more.
>
> kernel/module/decompress.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/module/decompress.c b/kernel/module/decompress.c
>index cce098671be97..ac4ff0e04f716 100644
>--- a/kernel/module/decompress.c
>+++ b/kernel/module/decompress.c
>@@ -216,7 +216,7 @@ static ssize_t module_zstd_decompress(struct load_info *info,
> 	ZSTD_DStream *dstream;
> 	size_t ret;
> 	size_t new_size = 0;
>-	int retval;
>+	ssize_t retval;

Why signed? Ok then.

> 
> 	if (size < sizeof(signature) ||
> 	    memcmp(buf, signature, sizeof(signature))) {
>@@ -276,7 +276,7 @@ static ssize_t module_zstd_decompress(struct load_info *info,
> 	} while (zstd_dec.pos == PAGE_SIZE && ret != 0);
> 
> 	if (retval) {
>-		pr_err("ZSTD-decompression failed with status %d\n", retval);
>+		pr_err("ZSTD-decompression failed with status %zd\n", retval);
> 		retval = -EINVAL;
> 		goto out;
> 	}
>

--- Thanks!
