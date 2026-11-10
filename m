Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319668;
	b=ht2YkqLisVBSGgyP9thefreAeS8rKP4I2jLvTR1lZEYurN+0r0HFAtS/UyoMU2HCPuRZ
	 zLU4LVsbPlomX3Uqzst0MQ68Zam9wnRG9Ys7n1vh5AkDzXlqeER9Dy7RBczLENq0Z5dbD
	 Cg1n7qyqrwrLf5otGEIRaXAzHE5eMVaRl7krlSAjjILyt2AmTYIU5ZY6oRhZsiczRwV53
	 59mAJMJVnsxJ+6ZJ6+PQ6rAZwsBBQ/tbd/2g9cJEZCG5k/nw2/RYYV+LreS4bvPj7bXiW
	 lmzasmtt08xghJ9omIzflPcbUZQuZNoec3TzUSvvODcgGsSSFa4fsdbFlGMLDR0j1jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319668;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o32XJk3B6ikVfi12PbmwjBY5KI6kvxLInmTz1VZt7Pw=;
	b=OkO+nppBbhOux97SGZaNKYOF2cotWH1wH+QjGzzhzVemSICj8ZXl2+1ZmSuQ+aRo4Mwp
	 flwuaU2MfqePSzQP0gyYUn5HztUF0l8u5dOPBNDHmlbwv6YQPlt5h9XjbgO1KI+zchBIH
	 vmoNCrI30G7yRlBIszA/n1EA4ex2eLXVEeMHhBxfswa9vaPJjOr4X3Ccr/DyuwCGdGvdl
	 gP60zKNovCJE19/EwtKy5v1AOS3ts43rBYJj8s4F5wwHitR+GoikKRZoLprQG3qKi3Bbd
	 s0rhrfhJPZLFaLRHNUKnTFV+0bF/K5m1xBv/Lkc2j/3BzWCZocw5pO20To+XECoKhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F9OtPTSA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F9OtPTSA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0311143D;
	Tue, 10 Nov 2026 06:07:43 -0800 (PST)
Received: from [10.0.136.86] (LRYFGMQP07.cambridge.arm.com [10.0.136.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E0B3F632;
	Tue, 10 Nov 2026 06:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794319667; bh=xqh7DJ+zVV52dERd2AmnJh4G5Obs3nbK4SBhiC/5OFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F9OtPTSAuCR3v0zdhUomHdxSKOH7WfvEa+Wn3w7XeU8yZoSOHT28dhZIhIxAYJnub
	 RL2VWiMb/wfGV5G7rTJQG2SyTATNBvgIlZGj6KD3A9ecb9VSVMaiJcqrrWkQbCZaAt
	 9STn87OzjVbmYjrZynUmOJVWlSS54fzzO9nNBmNI=
Message-ID: <3f68c02d-066d-40e6-b86c-bf41def97464@arm.com>
Date: Tue, 10 Nov 2026 14:07:44 +0000
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
Subject: Re: [PATCH v2] tools/mm/thpmaps: handle carriage returns and
 non-UTF-8 filenames
To: Weilin Tong <tongweilin@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261104061641.1115805-1-tongweilin@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261104061641.1115805-1-tongweilin@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 06:16, Weilin Tong wrote:
> VMAList opens smaps with universal newline handling and strict decoding.
> A carriage return in a mapped filename can split a header into multiple
> records, while non-UTF-8 bytes cause UnicodeDecodeError.
> 
> Read LF-terminated records and use surrogateescape to preserve filename
> bytes. Escape filename characters that stdout cannot encode to avoid
> UnicodeEncodeError when printing mapping names.
> 
> Fixes: 2444172cfde4 ("tools/mm: add thpmaps script to dump THP usage info")
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Link: https://lore.kernel.org/linux-mm/20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org/
> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> Changes in v2:
> - Escape unencodable mapping names in vma_print() (Sashiko).
> - Rebase onto mm-new.
> 
> Link to v1: https://lore.kernel.org/linux-mm/20261102085419.696232-1-tongweilin@linux.alibaba.com/
> 
>  tools/mm/thpmaps | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
> index a1a9bc30514f..0e17723515cd 100644
> --- a/tools/mm/thpmaps
> +++ b/tools/mm/thpmaps
> @@ -196,7 +196,8 @@ class VMAList:
>      # instance to receive VMAs.
>      def __init__(self, pid='self', stats=[]):
>          self.vmas = []
> -        with open(f'/proc/{pid}/smaps', 'r') as file:
> +        with open(f'/proc/{pid}/smaps', 'r', newline='\n',
> +                  errors='surrogateescape') as file:
>              for line in file:
>                  elements = line.rstrip('\n').split(maxsplit=5)
>                  if '-' in elements[0]:
> @@ -363,12 +364,14 @@ def cont_parse(vma, order, ranges, anons, heads):
>  def vma_print(vma, pid):
>      # Prints a VMA instance in a format similar to smaps. The main difference is
>      # that the pid is included as the first value.
> +    name = vma.name.encode(sys.stdout.encoding, errors='backslashreplace')
> +    name = name.decode(sys.stdout.encoding)
>      print("{:010d}: {:016x}-{:016x} {}{}{}{} {:08x} {:02x}:{:02x} {:08x} {}"
>          .format(
>              pid, vma.start, vma.end,
>              'r' if vma.read else '-', 'w' if vma.write else '-',
>              'x' if vma.execute else '-', 'p' if vma.private else 's',
> -            vma.pgoff, vma.major, vma.minor, vma.inode, vma.name
> +            vma.pgoff, vma.major, vma.minor, vma.inode, name
>          ))
>  
>  
> 
> base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282

