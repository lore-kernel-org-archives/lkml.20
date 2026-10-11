Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5862544F574
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726642; cv=none; b=vDUncalJvJ5L2/GUelwO9mVeNNJIDxosnvxw446ur49qjBrJ/BAlKnILmF+GRnf93S0cgjUbqUlwyP+QzN0/7xOf48F3KM0AT37Crgipbd8EqRmvsBb1qs0cDzAkkR/NTz1oylJ362DkKkLBuWvQQB7i/3sQofUbvsgwEtgK2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726642; c=relaxed/simple;
	bh=H8I9XP+B/vTgOqGSaUBn9vQyJTZbb/WUJ+8CZ2HN8QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJxewEuoQRAR5pRzmQQUVBqCC3dEeyiCnkAE8/wsZ7S8P4B45nIRocFZ5cbUwjoNCktwNW3o3DxW/l5ClV2XIUgA725l38FqX9TuklS8U7wYeznkjEBa6+IjisbvKyzdEw7aQ4MmR+WMWTzo1EH3wdOjqW6BI500vso6CdQINgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjGs1jUe; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjGs1jUe"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-82380b0f55dso573905a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726640; x=1792331440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P1eY/haq7fMC4SvzoecDkVUT56A4fNtRDaCNRTVYRw=;
        b=mjGs1jUesMZI5AW/gHSaVTSLvEu3xdZW9o+TMvxBQLTYqzs06beGi5cVKOTClwsXLE
         YeeUBiFqo3EDya5DobrXeW0cH3h8pfuclkbMBDBK0cAAUNlmaou/+L1jbAtVUD9UPBNd
         1QXqn+PqBZ5ONf4qcKNW0UJJbXnxBAp1xm2xoH4CzJmqx8ksmM04Tcr00H6VekTtw2Ym
         q6oYHYBx1sdDuqgpGNGElBBbqu0TI3QIsRBFYHWA6evAHy8D4zBfY81VGxZxkHZe8IPE
         pNVXGHw+Sk0jmg1HxRZ6vhbcHGw4+HpAe+5YBDYbf61okZFGOkGtDqgULP+pbdv13B2F
         IrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726640; x=1792331440;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9P1eY/haq7fMC4SvzoecDkVUT56A4fNtRDaCNRTVYRw=;
        b=lMxbUgVdW29pNSrFGoAMRXAG5/QHxU5s4StW4/eT8rohzf8XNTOx5BGQwj0JLOBhSG
         B6FwHwysHQD2DlOoo+dV3KO8Qbo+ulV/jtB2QSKZhHdPvLWST4Yv4Uccl5SdUNVDpaPL
         gBbCJ3LJl/7ZKdyPMwQIvmic5RlVsdad1+FhWb/uPflIUF7WSWDuZ2LsD8fZaFBZ7qXH
         dK06SQm4thZOOGSsWb5oB54mN3bTzG2peyWpccqEypx8aQaOtZOhaS+teQNx2AeVRecy
         kv9apncfB1HIEIU07Wu99rH5Ph0oN1nLaOQD1pnst2owHjys03Bp2+VW47BFVbXS2kSk
         Be4A==
X-Gm-Message-State: AFq9FYLZ4mmTOLwzRr5HbVI/z2sThUG/pMH7yfp1hzPACIks5KUPctdw
	0+8M1FYsG0ZpvtvmpV8f5sHK51YyWgXmYKgR2DsqGdefBjvGKsLjv6Ha6cEjWcrf5DO87w==
X-Gm-Gg: AYBFou1F2fsIdgo8agGZVG1hR0yDRzndo9DVR+Bt4PkyarGliNNoPevId7icgwHAxbU
	LTSo5Nrt4F4ZNcL9b8yRXwY3glxZk1JEPpWoSs0TAY1RAT6PhVJQtUcZYazbkfKIPkhkbCarzoo
	oFsGnSwRhOBZQCDoPzQOVkAzdXyasVYhOPcgcSCJ4aZlgb/74qFW9NZz4rgVfHyCw1uvz+Ticvj
	ZfnnZ2mZWHt1Ed8xgUJO1WWej+PEIfz/MZYE84qF5fLt9DCbSKisWRvYgl4oEVTojoxWqaxPXko
	Sjej1XkBvRlQn/WsFR7M3ZrYBdSh709O45oEe+O2pyyuwdhkAStCuN72zWnTnPnSWAOR5znE7Sz
	D+iOyX6HZ+c22CdK/ssXjQhuOGQximxh12JjHAqV42geJd7o6BKkScYIKL4rIIMzx/+0NErHn3J
	B1R/8s25IQhw5/TSHW+3AjmnNQF1aTnDJtrhcPppzxw4cZ022s68rTpkChhko56J40rdVJNKXYA
	H/+G1PJVRS0fKVvtMGYG5mKlIR6NwX30eHjqCKUgQFmKcaUn7tkw2ZqwGFapXs=
X-Received: by 2002:a05:6830:440a:b0:822:e94e:349b with SMTP id 46e09a7af769-8309815d753mr6708923a34.30.1791726640152;
        Sun, 11 Oct 2026 06:50:40 -0700 (PDT)
Received: from [10.189.183.117] ([172.59.193.215])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076d67sm7680519a34.13.2026.10.11.06.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 06:50:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4922d878-9429-462e-9b24-ced0b66e1a09@gmail.com>
Date: Sun, 11 Oct 2026 14:50:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: show number of search results in search UI
To: Zuo An <zuoan.penguin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
References: <aspVmnam3QL_DRYV@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <aspVmnam3QL_DRYV@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zuo,

On 10/10/26 16:11, Zuo An wrote:
> When searching for symbols in nconfig/menuconfig, the search
> results popup will now display a count of the results
> in the title bar, e.g. "Search Results (42)".
> 
> This helps the user to gauge the number of matches quickly and
> refine their search if needed, rather than having to scroll down
> by an indefinite amount (especially for nconfig's UI which lacks
> a display of the scrolling progress).
> 
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
> ---
>  scripts/kconfig/lkc_proto.h |  2 +-
>  scripts/kconfig/mconf.c     | 10 ++++++++--
>  scripts/kconfig/nconf.c     | 10 ++++++++--
>  scripts/kconfig/qconf.cc    |  2 +-
>  scripts/kconfig/symbol.c    |  4 +++-
>  5 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 8914b4e8f2a8..224acc142769 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -21,7 +21,7 @@ bool conf_errors(void);
>  struct symbol * sym_lookup(const char *name, int flags);
>  struct symbol * sym_find(const char *name);
>  void print_symbol_for_listconfig(struct symbol *sym);
> -struct symbol ** sym_re_search(const char *pattern);
> +struct symbol ** sym_re_search(const char *pattern, int *sym_cnt);
>  const char * sym_type_name(enum symbol_type type);
>  void sym_calc_value(struct symbol *sym);
>  bool sym_dep_errors(void);
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index b8b7bba84a65..f37c3f8e1f4d 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -384,8 +384,10 @@ static void show_help(struct menu *menu)
>  static void search_conf(void)
>  {
>  	struct symbol **sym_arr;
> +	int sym_cnt;
>  	struct gstr res;
>  	struct gstr title;
> +	struct gstr res_title;
>  	char *dialog_input;
>  	int dres, vscroll = 0, hscroll = 0;
>  	bool again;
> @@ -422,7 +424,7 @@ static void search_conf(void)
>  	stpart.text = str_get(&sttext);
>  	list_add_tail(&stpart.entries, &trail);
>  
> -	sym_arr = sym_re_search(dialog_input);
> +	sym_arr = sym_re_search(dialog_input, &sym_cnt);
>  	do {
>  		LIST_HEAD(head);
>  		struct search_data data = {
> @@ -433,9 +435,13 @@ static void search_conf(void)
>  		jump_key_char = 0;
>  		res = get_relations_str(sym_arr, &head);
>  		set_subtitle();
> -		dres = show_textbox_ext("Search Results", str_get(&res), 0, 0,
> +
> +		res_title = str_new();
> +		str_printf(&res_title, "Search Results (%d)", sym_cnt);
> +		dres = show_textbox_ext(str_get(&res_title), str_get(&res), 0, 0,
>  					&vscroll, &hscroll,
>  					handle_search_keys, &data);
> +
>  		again = false;
>  		if (dres >= '1' && dres <= '9') {
>  			assert(data.target != NULL);
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 521700ed7152..e3b25940b931 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -700,8 +700,10 @@ static int do_exit(void)
>  static void search_conf(void)
>  {
>  	struct symbol **sym_arr;
> +	int sym_cnt;
>  	struct gstr res;
>  	struct gstr title;
> +	struct gstr res_title;
>  	char *dialog_input;
>  	int dres, vscroll = 0, hscroll = 0;
>  	bool again;
> @@ -732,7 +734,7 @@ static void search_conf(void)
>  	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
>  		dialog_input += strlen(CONFIG_);
>  
> -	sym_arr = sym_re_search(dialog_input);
> +	sym_arr = sym_re_search(dialog_input, &sym_cnt);
>  
>  	do {
>  		LIST_HEAD(head);
> @@ -742,10 +744,14 @@ static void search_conf(void)
>  		};
>  		jump_key_char = 0;
>  		res = get_relations_str(sym_arr, &head);
> +
> +		res_title = str_new();
> +		str_printf(&res_title, "Search Results (%d)", sym_cnt);
>  		dres = show_scroll_win_ext(main_window,
> -				"Search Results", str_get(&res),
> +				str_get(&res_title), str_get(&res),
>  				&vscroll, &hscroll,
>  				handle_search_keys, &data);
> +
>  		again = false;
>  		if (dres >= '1' && dres <= '9') {
>  			assert(data.target != NULL);
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index b02ead7a3f98..8f51dc55226d 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1245,7 +1245,7 @@ void ConfigSearchWindow::search(void)
>  	list->clear();
>  	info->clear();
>  
> -	result = sym_re_search(editField->text().toLatin1());
> +	result = sym_re_search(editField->text().toLatin1(), nullptr);
>  	if (!result)
>  		return;
>  	for (p = result; *p; p++) {
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 7e81b3676ee9..31f927bd563a 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1020,7 +1020,7 @@ static int sym_rel_comp(const void *sym1, const void *sym2)
>  	return strcmp(s1->sym->name, s2->sym->name);
>  }
>  
> -struct symbol **sym_re_search(const char *pattern)
> +struct symbol **sym_re_search(const char *pattern, int *sym_cnt)
>  {
>  	struct symbol *sym, **sym_arr = NULL;
>  	struct sym_match *sym_match_arr = NULL;
> @@ -1065,6 +1065,8 @@ struct symbol **sym_re_search(const char *pattern)
>  			sym_arr[i] = sym_match_arr[i].sym;
>  		sym_arr[cnt] = NULL;
>  	}
> +	if (sym_cnt)
> +		*sym_cnt = cnt;
>  sym_re_search_free:
>  	/* sym_match_arr can be NULL if no match, but free(NULL) is OK */
>  	free(sym_match_arr);
> -- 2.56.0
> 

Sashiko has some concerns about uninitialized memory. The alarms look
accurate to me:

https://sashiko.dev/#/patchset/aspVmnam3QL_DRYV%40gmail.com

- Julian Braha

