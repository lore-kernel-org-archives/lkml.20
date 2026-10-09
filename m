Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FCA33C1BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514731; cv=none; b=N+aTQptQq5bAyDLIZvAWxKFN/buEkxuJqRt1t9LlOjNQBK0bOhkfLa5Yj32GKTSQGGCQYFatqTGB2kLiGV2IEeTQ7CuI56loyIQI0i8Xqu+0E/BqFVIsDSNPxNRWkDoYmCxiLFRLvHaxy9XCRDjQZIfO3b8rZWL3jTOO8ehQQ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514731; c=relaxed/simple;
	bh=MNvr+DbdsCxNj+Ha9nzMNVNZQecmMlPkvNM4YtBQ+JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr/LW5J/nas2aqsOo7V2RIWlxZ1OwNVfLUQQGbyzW2Lp9YJHe22vjvy2E+odAiH+B4gfWVU1NnW8kB3bRjnyAXUKqMD8Xe57btGFlZ81Mmtq3WeOLuiaxOlHoPGZiO7osEDU16i7SBWRHyNOERx8mP6J5hIWxkx6/wIkW2q1OPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KlqlBknt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KlqlBknt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-487002c964eso193383f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791514728; x=1792119528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+iyPvnyC0wQuPh/K+mYDhdaAhHwMxdH+RIdFuzmmPo=;
        b=KlqlBkntFASm336kLukY7RlQq7jWSVc+Zfnxw8PYbiZrwgzvh9jChDNq6FhFlLrxfg
         db0wObyqrdTgsJIC0/BT/+tm6e6ZyRtsfojXEFk7huzv+DoSYBaisBCUGrl+9pxoMUow
         OESC1wGWhPb9N488ibBnU9Zpi1Ys3pAkZoW3787+oa8+uz0K7DAtcyOR5KVARI8TlTap
         /rsGGZQHwhS/lRJ4WDbEZi7ZACQbo8DGMYHvGV12BbxuOPDqEBhprhyUCi/lHTAcUQY+
         9jenVE35QBrChhIu5ALfgWFISLTVfOKm6I0e6MVykGsSfenD5qrfqau/oRswhdR9HKBB
         Y3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514728; x=1792119528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+iyPvnyC0wQuPh/K+mYDhdaAhHwMxdH+RIdFuzmmPo=;
        b=INmVPJk+MDzd/A2t+4klHf1to+sF8vWI3MDxD05hyY0Q7NnHaZjmJCVEJXKipgn4HF
         sAnINGe8SG3857p+oaL7pgaO0bNiHOlD2E1ddGfFE0KEu4nh2KvzFuOw7t5mZgOmk5ud
         Qpe/ojyo51B7X7o6mPcPmySEMN1qm0IBKa1LDbBXmN94JgADzC5rVMLrnPE8DUC6+4Ne
         2A1iEyhNCX8qXKy75uq/WcXMqKN3+zQxwhiO72E6sN1X2zyU3ewtvfDT+h1hqEIKwqWt
         ltEMfgDF+wjIK6JIfx68vcSK/fbOt4qBpLo3EtED8pbmEv/fm4by5RTGlPO2ceLS9CgJ
         7SBw==
X-Forwarded-Encrypted: i=1; AKwUvBzCC8+UDQzyOfPXkQuzpkGNsV88V4AG5jApCXwYocp0Gk48ukF6qNPBlQWwBiAhsWLalQE8Y5vHg1l4Njs=@vger.kernel.org
X-Gm-Message-State: AFuF++ktmxC5RU3Jc61Seb7MwewJUa9/yTSCLt3TCihpDasF0f7QQCuc
	AzjDqyumO/8+vz0ILX1IHTFlxWGpL6TYSC3wlgkotR92RQoO5/kbEGPAmCCzWxdOetQ=
X-Gm-Gg: AYBFou2rUhH20SKet41H1NFAoWh8AvYic2hXA1q8NoERH1bCppamYx1WMHedIe+Xbs5
	Bu6hG9Kyz+n+fU88N2vhMC0QczYHROeSMcdhiHHC1w11jhFG0eyThE5W0DCNwNVXoGO/guU1/Fk
	HXNaoT2ghgoi5W5R+8BKDlw/sDzaQdYbE5Fk1BzNLy0sLl4kmkQ5EXq4j++ATh4mLZ21qeEfldC
	5J/DROqh7EDe1OiA6gJ0wBCqJIRv7iiK9bpl5ouCh6+EzUo1IJH3I/rqOw9eGsvG1yMMpu2Qz7j
	VYm1sh0G9WEplDRs0SJENXsIQpWpw4i+hd2EW1NibORUExcSvJQZ4CwnY8ypDWzPEv781Z1hDnu
	izrZdxWsaN/LNNLVacenqwZltT9W8anwkAokwxFsN4TDz7pNyBWcEe4eRf4/bbkknt1CPnNtUAh
	7VDnQA1AqOEIK/vgSJnpnP+Ok+jDtHcPGXAyiaDp/xRf/oXSDeMQkf+kX1xxG8mNhotMENM8lNN
	DkxyDs=
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr6850745e9.0.1791514728194;
        Thu, 08 Oct 2026 19:58:48 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a02f85sm2447925ad.10.2026.10.08.19.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:58:46 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:58:42 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Anderson Ferneda <anderson.ferneda@braza.com.br>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ocfs2: deal with legacy signed dir index name hash
 values
Message-ID: <ashYTCl9usNNPdXa@p15>
References: <20261008122743.616779-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008122743.616779-1-joseph.qi@linux.alibaba.com>

On Thu, Oct 08, 2026 at 08:27:42PM +0800, Joseph Qi wrote:
> Commit 3bc753c06dd0 ("kbuild: treat char as always unsigned") set
> -funsigned-char globally, which changed the result of the naked 'char'
> load in str2hashbuf():
> 
> 	val = msg[i] + (val << 8);
> 
> A name byte >= 0x80 used to sign-extend and now zero-extends, so
> ocfs2_dx_dir_name_hash() computes a different hash pair for every name
> containing one.  The pair is written into the dx leaf when the entry is
> created, so an index built by an older kernel no longer matches and
> ocfs2_dx_dir_search() returns -ENOENT for a name that readdir still
> lists.
> 
> Search with the current unsigned hash and, on a miss, retry with the
> legacy signed one, as ext4 does in commit f3bbac32475b2 ("ext4: deal
> with legacy signed xattr name hash values").  New entries are always
> indexed under the unsigned hash.  Skip the retry when the two hashes
> are equal, so that a miss on an ASCII name does not walk the index
> twice.
> 
> The retry costs a second walk of the dx tree, so a negative lookup of a
> name containing a byte >= 0x80 does twice the work.  That is bounded and
> worth it, and directories whose dx root is still inline pay nothing
> extra, since there the retry only rescans the root block that is already
> loaded.  Nothing retires it at runtime: a legacy entry keeps its legacy
> hash, because neither deleting nor updating an entry rewrites the dx
> hash, and the only code that rehashes existing dirents is
> ocfs2_expand_inline_dir() on the inline to extent conversion.
> Rebuilding the index offline is what removes the cost for good.
> 
> Also spell out the signedness in str2hashbuf() instead of leaving the
> current hash to -funsigned-char, as commit 854f0912f813 ("ext4: make
> xattr char unsignedness in hash explicit") did, so that both variants
> stay correct if this is backported to a kernel without the flag.
> 
> Reported-by: Anderson Ferneda <anderson.ferneda@braza.com.br>
> Link: https://lore.kernel.org/ocfs2-devel/CP5P284MB2780AC2C3C2AB2CF2B6CB7AFBE942@CP5P284MB2780.BRAP284.PROD.OUTLOOK.COM/
> Exposed-by: 3bc753c06dd0 ("kbuild: treat char as always unsigned")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/dir.c | 76 ++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
> index 55c4a305a282..3f159a20a248 100644
> --- a/fs/ocfs2/dir.c
> +++ b/fs/ocfs2/dir.c
> @@ -221,7 +221,8 @@ static void TEA_transform(__u32 buf[4], __u32 const in[])
>  	buf[1] += b1;
>  }
>  
> -static void str2hashbuf(const char *msg, int len, __u32 *buf, int num)
> +static void str2hashbuf(const char *msg, int len, __u32 *buf, int num,
> +			bool legacy_signed)
>  {
>  	__u32	pad, val;
>  	int	i;
> @@ -235,7 +236,10 @@ static void str2hashbuf(const char *msg, int len, __u32 *buf, int num)
>  	for (i = 0; i < len; i++) {
>  		if ((i % 4) == 0)
>  			val = pad;
> -		val = msg[i] + (val << 8);
> +		if (legacy_signed)
> +			val = (signed char)msg[i] + (val << 8);
> +		else
> +			val = (unsigned char)msg[i] + (val << 8);
>  		if ((i % 4) == 3) {
>  			*buf++ = val;
>  			val = pad;
> @@ -248,8 +252,9 @@ static void str2hashbuf(const char *msg, int len, __u32 *buf, int num)
>  		*buf++ = pad;
>  }
>  
> -static void ocfs2_dx_dir_name_hash(struct inode *dir, const char *name, int len,
> -				   struct ocfs2_dx_hinfo *hinfo)
> +static void __ocfs2_dx_dir_name_hash(struct inode *dir, const char *name,
> +				     int len, struct ocfs2_dx_hinfo *hinfo,
> +				     bool legacy_signed)
>  {
>  	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
>  	const char	*p;
> @@ -279,7 +284,7 @@ static void ocfs2_dx_dir_name_hash(struct inode *dir, const char *name, int len,
>  
>  	p = name;
>  	while (len > 0) {
> -		str2hashbuf(p, len, in, 4);
> +		str2hashbuf(p, len, in, 4, legacy_signed);
>  		TEA_transform(buf, in);
>  		len -= 16;
>  		p += 16;
> @@ -290,6 +295,19 @@ static void ocfs2_dx_dir_name_hash(struct inode *dir, const char *name, int len,
>  	hinfo->minor_hash = buf[1];
>  }
>  
> +static void ocfs2_dx_dir_name_hash(struct inode *dir, const char *name, int len,
> +				   struct ocfs2_dx_hinfo *hinfo)
> +{
> +	__ocfs2_dx_dir_name_hash(dir, name, len, hinfo, false);
> +}
> +
> +static void ocfs2_dx_dir_name_hash_signed(struct inode *dir, const char *name,
> +					  int len,
> +					  struct ocfs2_dx_hinfo *hinfo)
> +{
> +	__ocfs2_dx_dir_name_hash(dir, name, len, hinfo, true);
> +}
> +
>  /*
>   * bh passed here can be an inode block or a dir data block, depending
>   * on the inode inline data flag.
> @@ -1021,10 +1039,10 @@ static int ocfs2_dx_dir_lookup(struct inode *inode,
>  	return ret;
>  }
>  
> -static int ocfs2_dx_dir_search(const char *name, int namelen,
> -			       struct inode *dir,
> -			       struct ocfs2_dx_root_block *dx_root,
> -			       struct ocfs2_dir_lookup_result *res)
> +static int __ocfs2_dx_dir_search(const char *name, int namelen,
> +				 struct inode *dir,
> +				 struct ocfs2_dx_root_block *dx_root,
> +				 struct ocfs2_dir_lookup_result *res)
>  {
>  	int ret, i, found;
>  	u64 phys;
> @@ -1037,8 +1055,6 @@ static int ocfs2_dx_dir_search(const char *name, int namelen,
>  	struct ocfs2_extent_list *dr_el;
>  	struct ocfs2_dx_entry_list *entry_list;
>  
> -	ocfs2_dx_dir_name_hash(dir, name, namelen, &res->dl_hinfo);
> -
>  	if (ocfs2_dx_root_inline(dx_root)) {
>  		entry_list = &dx_root->dr_entries;
>  		goto search;
> @@ -1135,6 +1151,44 @@ static int ocfs2_dx_dir_search(const char *name, int namelen,
>  	return ret;
>  }
>  
> +static int ocfs2_dx_dir_search(const char *name, int namelen,
> +			       struct inode *dir,
> +			       struct ocfs2_dx_root_block *dx_root,
> +			       struct ocfs2_dir_lookup_result *res)
> +{
> +	struct ocfs2_dx_hinfo legacy;
> +	int ret;
> +
> +	ocfs2_dx_dir_name_hash(dir, name, namelen, &res->dl_hinfo);
> +
> +	ret = __ocfs2_dx_dir_search(name, namelen, dir, dx_root, res);
> +	if (ret != -ENOENT)
> +		return ret;
> +
> +	/*
> +	 * Nothing under the current hash.  The entry may have been indexed by
> +	 * an older kernel, which sign-extended the name bytes when hashing.
> +	 * New entries are always indexed under the unsigned hash, so only fall
> +	 * back to the legacy signed one when it can actually differ: an ASCII
> +	 * name hashes the same either way, and a genuine miss on one should
> +	 * not have to walk the index twice.
> +	 */
> +	ocfs2_dx_dir_name_hash_signed(dir, name, namelen, &legacy);
> +	if (legacy.major_hash == res->dl_hinfo.major_hash &&
> +	    legacy.minor_hash == res->dl_hinfo.minor_hash)
> +		return ret;
> +
> +	res->dl_hinfo = legacy;
> +
> +	ret = __ocfs2_dx_dir_search(name, namelen, dir, dx_root, res);
> +	if (ret)
> +		return ret;
> +
> +	pr_warn_once("ocfs2: directory index with signed name hash\n");
> +
> +	return 0;
> +}
> +
>  static int ocfs2_find_entry_dx(const char *name, int namelen,
>  			       struct inode *dir,
>  			       struct ocfs2_dir_lookup_result *lookup)
> -- 
> 2.39.3
> 
