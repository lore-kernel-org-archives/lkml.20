Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602443;
	b=pJmGPP+Vowg/jR9JdZOWeOGu5E0/vec9fbaKhz2mmaxvpUxCB0OhZHk1CMMftBP5TZgn
	 /gV9XNf0UROuayTS6bwJlEJ+C4vvhxaeeYQeBcF+lUXb1cY7LHHfuLGTW5uasY0YpYZfT
	 +I0t4jjcmneWecX5WAyeJ5XyCPPd79jh2IuF9uU++q13omHCAYB7maIdNykzB4shjUW7E
	 du4az+16JHCnd1wW3zZcoZf/LQAWS9iUGUlM/eBBmbeiEte/dpofkm1iRXKuguVUTXvDR
	 Qk23zQLwnAPc1WPpVE+rnr8o3tItQRdmvMMuUvbhfKoksPAav9xjfuMTQ6SCeUJSUyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e0R5eQQgTdpSlU+oUfRU2hbSIpRyLJ1/Cjf8UXH8R78=;
	b=YYDhYZz+rbiHc1Oi3nSd+bRsrpgSqJpbUBzpCodsChl+B9DYydQPjVvg1HCIYTPae/yd
	 aJCInYb7dCZMbplidxNd06s02HgL127QW6h82zPhY4GTn/SmxTYg4FRsUL04A04GpzwT/
	 BmKgp21YLttEj+HIKxL91GwROfWfvH6qNQ8l4d9zomlBOMmfD8xEy2VgSTBKPJEM+Gf9c
	 Amkh9+qOF2mgxPEofPFz4uIelpvaweUtZGvcgef/ADFrm54b2AFtV02wUYb9+uE9trATs
	 yNmEgVYCFE2S4gxNRQvjgLI7PmiUP5pWQs7hOeEI27KeJCR+gViRO1OMq6a7/ICe5Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F9h0RjGL;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE2606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DE2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F9h0RjGL
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5363316fa0cso11307661cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792602442; x=1793207242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0R5eQQgTdpSlU+oUfRU2hbSIpRyLJ1/Cjf8UXH8R78=;
        b=F9h0RjGLS0HcXPP8Lzs70DqrmIbMaklOZic6JTfWxOKvcoT80HSKNpl88Y3z4SuFex
         K0sa3BpTUNKpl1nH387ihAHymr8rCGkE8591JkZxYJkVv5IPpGOa6V6pm7y5aHUnOlwS
         RzxzvOns3zn7OqUFZijDG3I4WyRyWlKE/VUG7FN+Qcg4gj7QJVVAx2CPJfP3sFcmHWsW
         BH/NRLuL3cNa6l9chmS+FjCv7BZ9HyxAa+SBaLfVyfbIjBLpUwReKVmvkXYgk5cof3ei
         Q1/wQMXNF++xOiXBYp3CVn4FKSvq5r//TZyig175cZxg64B61fmrRxj4cgi4jswVaO1Y
         3M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602442; x=1793207242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0R5eQQgTdpSlU+oUfRU2hbSIpRyLJ1/Cjf8UXH8R78=;
        b=O1tGZRf6K0QEwjF2ShL25e4X/6hbfxQ4XFTfVwi8ov1eYSX8eMSjGmI8VRBPTPodnu
         Hb5Y9kJYG/D3DOGX3js3letZNLsYsOVDBZxuCKkdELJp7ai8L5Fxsu9lEvJU7mwdrNPT
         nWQYc8Ve7wo+kRd6Iqk+GhPk1+v7BSrvVa5mJOFobgYuTGbm3Wmml9d9DSu+ut4pWM6k
         qSZft8z1jsj95yokFfSxPoCcAgqWAg34uAr+ouFIueHgFNU/PYVZGtwkC9elMLoIewf1
         x0ChoohWyFSqLpYfutuA3Jk2gVf3k69PXI49Kde2OkxEUb0/Uw4KT8aQFHsYhU3WJRIK
         lNtQ==
X-Forwarded-Encrypted: i=1; AKwUvByUeZCE1STU/BxyxDgKiCgOs4IJZsUvjbT5SXYcGUmpga1M9/A94jz7W98N636SX4FUFK88dFQ5PsNdqJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4lGiNxiatiL1DT8r+msbm6Qph8k7G19kfsuaIbis3rkXCcOah
	wWYzc4gkE3kj14J/w7LUNpgipJs3oXpQ5Meo8QCa/zy5IR63f+LXWu0cnLt/Z/0emf0=
X-Gm-Gg: AYBFou2p0vAbJEm1Vp/gjtwotUIL61GYtTfDRAd0YhsO6fFPIR5GQeKv9HdeObKu2tK
	MlhXhJZ2JRjBr2TKhaaPmdrZPNgWGW0UDof6eQj8NNDk+3iSoXaFgtooEPZBBx2te5yxnchfkBb
	6wkzQQfCZ3ODVIDcwvtLReUyHdarL/EPH+pgNbhNwWkCGxGpzs5cQFax6VSebxtROvm8PWk4JSI
	lbHmWGgOYWIyAsZP8A3imJq3i/hgW6uJhZGABosNQBka2BZadOFWQ/2AF14Y5nqKAFl7Th9aiOr
	JUn4c38u5tcGPCPw3DPfAfd4gG7wCuvsTMEz89aFtiJ6IHq/9uSg1uzR4zaNS0IPcUCG/O+Aaq8
	5+CHmwE4XYNAzz5uLVXo2GJ7JvRgm/cZcJYCSh4KLxg2UIuPIAjmEPBEfyHQiYHH/UivW26HEJh
	NiPkWjwoW+PawpCU0aHx9ENVEVHYb46EaVLbm25513MnOJMJ9vJ60RSWncqVXtFL+T7St/adZEE
	Bx5H61tSjTyGEhzUSwn08iPpttR5s+ipOjaKEyTRD8xibCSrF6XEx+FAu6rCpDR2tiG2y8vrbb/
	qx3ZGpXv2egTjQg7dxSggAKWIiH5zI82ZD5lAJntDWcXh1AOrzsJmDlIgoI=
X-Received: by 2002:a05:622a:e10b:10b0:536:43d6:2a94 with SMTP id d75a77b69052e-5369b813476mr30068181cf.34.1792602441721;
        Wed, 21 Oct 2026 10:07:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab7624c1sm4234501cf.19.2026.10.21.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:07:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJZmZ-0000000E9s9-1fwu;
	Wed, 21 Oct 2026 14:07:19 -0300
Date: Wed, 21 Oct 2026 14:07:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] rust: fwctl: declare cfi_encoding for fwctl_rpc_scope
Message-ID: <20261021170719.GU14213@ziepe.ca>
References: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com>

On Tue, Oct 20, 2026 at 08:28:37AM +0000, Alice Ryhl wrote:
> Currently, VTable::fw_rpc_callback() takes scope as a u32, whereas C
> calls fwctl_ops::fw_rpc with enum fwctl_rpc_scope. With kCFI enabled,
> enum types are encoded distinctly from integers, causing every fw_rpc
> indirect call into a Rust fwctl driver to trip a CFI failure. Thus,
> generate fwctl_rpc_scope as a newtype with a cfi_encoding attribute and
> use it in fw_rpc_callback().
> 
> Cc: stable@vger.kernel.org
> Fixes: e052daab94ee ("rust: introduce abstractions for fwctl")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/bindgen_parameters |  2 ++
>  rust/kernel/fwctl.rs    | 12 ++++++------
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied

Thanks,
Jason
