Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FF53E1738
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950760; cv=pass; b=TLDs9lyQlRAuG3Pn3Z6Hclwy0Jn+Glss/vnlMiSzZC8oUIoKKvQBLJ90SokobnLPZXe8/DzhcaNj8jCIb6FsFwEF36iM0D5xcVzGOH1CTMJeZTzZgm7lO1u+PfXNU5Hly4Ubi8pxVRBWMPlApqnydhuqj3Ji7bdJGvHQaf4j+p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950760; c=relaxed/simple;
	bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv7wGqKLNwVkevYYqaBAB9cFYTmM1QPgnVHT8bvmiFlnHphxZMylrO049dde0nLT0NUfeVubr4jBaaoDJ/qTQ+CoRWmLBV22UmESts3iX1sMID5f/6modhZy3+SndEnfwkUr9iGtZOL4x1VKV+R3t4Hdrm6KdAtyR0LgXoRC64U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEnwFclh; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEnwFclh"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52fac937235so21711cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950756; cv=none;
        d=google.com; s=arc-20260327;
        b=UEsDXFF3eZOAonwhjQfnNYD45phShxVPYblB+3vlq2n2ikBr0ARnKPT5LJupAjWG0x
         BLeb12XKdw74EQ2ZzHemLYbbP22U/vNIH3QGBY5WfslDwa/Ji8q+YXSabYpOuUq59Ur8
         E12jzuK33V9C4jBeVkKNr6/Vo2wXCcZZbyB/Bb1gTfTCYKg5nKybDpGyJXq9jyGjxGEE
         49t5sqrKRmhgPBkAKIoo3Bs/oI4XESoXUHLGVo1EzHIE+L62nkQVKOdABycm4GjOjopB
         QpuBnZtuo1iOHJ8f5NzH35Jo8MkW0BGPZm9XXmC4tjQzcYq3KxFh3kezZXfUmXbacqFA
         oXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        fh=f2NvUpZeQOg6hQpsSUA1ktzCBoOQBh0GrjHKB9eeVQM=;
        b=cKf0f3fZKe8nt0bGKIA/Tx2yyg7F6Niw/3a2rdXNHriWEQennoh5cWYqRnJqEkHaPq
         BV2MTRXzP1oNOSsp4eILwkQ7CpLwR9VU1hEOCLNcyfWDCTvkQP1t2TZKueEeaqkJwCKA
         9PITNVn3xbmRcQo+2O6xeyH98OzhIGn951cnqB3PyN7pyW9wb2E681LPvE+/u8Uufnkl
         +KScBHfuHxMZL3mYnhuN8s7+ItBXE3f09wpfT2dhoeUKQGQvhB8R+393JTvfrvEksSlW
         NbnpPnOhfmG440EF6W8BGGH3zRDXXpgS2ElAvlmguPZqABi6ZxV2W05E22zw7ahhoJzk
         nnXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950756; x=1788555556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        b=tEnwFclhlqyqu+78nKbipQX97BQGXYmCP6EpTkjj4+yLp641Y9evxUlqGAa3is5CrR
         uxIlvSenoCvGikzj0UoLWyOhyJBJZ5iSBsQizW60U0UwaepJWNtU7Ou1p5T9JbZKfJCZ
         W0DM2xaoB8S+QtwxTzNI6/9UD0BzW154Y1tgaswfTDTDeK0E8bfwMMYGFq3ZLD7cXQk6
         GDhgblPW35ho95n7ZpquTDKKTS928ENMELaPpSF4LEqBpVSrGnZ5PagJXQ3yIMNNJJaN
         ZCm9+mwQtIkzHYc0n8Z2XX1s7+Dy8SqLUzk9Llu3xlIJVO+ucpvgTLTD8KDAjTxYCgyr
         40nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950756; x=1788555556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        b=fAOWfV4z7i0r10G+546qm9KhfIomk9xmyN11wLq+7iue6Y8dYOFyHhKny+5NwjyXqV
         RlH9RtFgvDNgCsznoTZBu8oEpD7pvHXpa9VEs/9vHXsLQntMcHuYZiKp+V+jarlpptqb
         Rkm4UNrDtsFy5Y0sCpBicpDsK+XK5CwlZD7jfJVhI089SPfaWyAy63lHLBer8w+99YeA
         qxFTYD2XbJ8dFScCx/dh/+UJMwmrqwBJbJv3hGlcecKZq9AEVc+OxUijGdx2Ab+aoTHK
         1lbspOJlWshaya4xXHlsuUK6Ogp/vpHRB2JtFkfIv/vEOMwPpdjAhunZaJegMWQ39T10
         xRaA==
X-Forwarded-Encrypted: i=1; AHgh+RoAhyi8d51Uc2A0Iiuf/X0z0abv1aTcRm7C08ohh7wFizW3Mql/Lex2H6IVXMVM8VgIDeN+6R6yUPUOf78=@vger.kernel.org
X-Gm-Message-State: AFuF++m9h85Pbsx6zG5jumNWUmV9SfldF/d+vySWBG14jBW0b+cmnrsw
	9kibPQ++VCbP2ocd9W16egyux8tX8fEXmQ3IL/84Z1rT3K3cC+8tipo+fRkx4gvtWwInDmmST9l
	mokPNWuaVF1w8DwfIY00mh8QGW+eUqc1fVAAwmHTz
X-Gm-Gg: AR+sD11pPeDEl8uCaPMu+o0JkjgP+w1fzMs/BTtUNdMyunDE2gPFhb8vE0ourEXZHOX
	+Tq1o2/pU/QME0VneevxIi8pk2xK+avuc0I4IZXLGAbTeaOyWuP84rwhy5tcWV7Yd0M8UqSaU6+
	04GLv6m+NXcYqYy5mQ8o8iEfkWFUVkAnX73064KiH5DWNMIVQh7aEohhpcinFzPYNG9kweB0D7f
	TSJdqpv/C8nbosmJz+/r7/LKKM3/3Tr5DE5Wd+RO4wR9ywfBz9f6ObrspYoDB/dzzquI9VmIDq5
	5v4Z+HZbO8dWcafvw0PqvlOsq06ja1b3DL9MRnDL3UE1VNn2T0hyDKgtWkUweyxI3MaeXAa1CLs
	=
X-Received: by 2002:ac8:6109:0:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52ff710cdc4mr3278821cf.14.1787950755287; Fri, 28 Aug 2026
 13:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-5-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-5-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 13:59:03 -0700
X-Gm-Features: AcwNN1WI_9DAW_34H7aprFGN9TAhxXzmVTrVu3YrXpEKWiXKUeYdo7vi9R_t0vg
Message-ID: <CAGtprH-Xi8-UGWTkVhNnd1dkmtcnFJsXOsTjr=ijK53aUuH4ng@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] x86/virt/tdx: Allocate refcounts for Dynamic
 PAMT memory
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The PAMT memory holds metadata for all possible TDX protected memory. Eac=
h
> physical address range is covered by PAMT entries at three levels (1GB,
> 2MB, 4KB). With Dynamic PAMT, the 4KB level of PAMT is allocated on
> demand. The kernel supplies the TDX module with page pairs to store the
> 4KB level entries, which cover 2MB of host physical memory. The kernel mu=
st
> provide this page pair before using pages from the range for TDX. If this
> is not done, SEAMCALLs that give the pages to be protected by the TDX
> module will fail.
>
> Allocate reference counters for every 2MB range to track TDX memory usage=
.
> This can be used to handle concurrent get/put callers, in order to
> accurately determine when the dynamic 4KB level of Dynamic PAMT needs to
> be allocated and when it can be freed.
>
> This allocation will currently consume 2MB for every 1TB of address
> space from 0 to max_pfn. The allocation size will depend on how the RAM i=
s
> physically laid out. In a worst case scenario where the entire 52 bit
> address space is covered this would be 8GB. Then the Dynamic PAMT refcoun=
t
> allocations could hypothetically cause the savings from Dynamic PAMT to g=
o
> negative on exotic platforms with sparse, small amounts of memory.
>
> Future changes could reduce this refcount overhead to be only allocating
> refcounts for physical ranges that contain memory that TDX can use.
> However, this is left for future work.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
